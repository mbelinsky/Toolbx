class User < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  has_secure_password

  belongs_to :city
  has_many :languages, through: :user_languages

  has_many :user_tools, dependent: :destroy
  has_many :tools, through: :user_tools

  has_many :apptivist_tools, dependent: :destroy, foreign_key: :apptivist_id
  has_many :owned_tools, through: :apptivist_tools, source: :tool

  has_many :apptivist_articles, dependent: :destroy, foreign_key: :apptivist_id
  has_many :features, through: :apptivist_articles, source: :article

  has_many :user_articles, dependent: :destroy
  has_many :articles, through: :user_articles

  has_many :user_categories, dependent: :destroy
  has_many :categories, through: :user_categories

  attr_accessor :new_user

  attr_accessible :description, :email, :facebook_username, :hide_email, :linkedin_username, :google_plus_id, :first_name, :password_digest, :last_name, :twitter_username, :website_url, :password, :password_confirmation, :username, :category_ids, :profile_picture, :city_id, :city_name, :bio, :role, :apptivist, :appstore_url, :google_play_url, :github_username, :tool_ids, :owned_tool_ids, :featured

  validates_length_of :bio, maximum: 1000, allow_blank: true

  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, email_format: [message: 'is not a valid email address']

  validates_uniqueness_of :username, allow_blank: true
  before_validation :downcase_username
  validates_format_of :username, with: /^[\d\w\-]+$/, allow_blank: true

  validates :password, length: { minimum: 8 }, if: :validate_password?
  validates :password_confirmation, on: :update, presence: true, if: :validate_password?

  before_create { generate_token(:toolbox_auth_token) }

  attr_reader :profile_picture_remote_url
  has_attached_file :profile_picture, styles: { medium: "140x140#", small: "60x60#", thumb: "30x30#" }, default_url: 'profile-default/missing_:style.png'
  validates_attachment_content_type :profile_picture, content_type: ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/xpng', 'image/gif'], message: 'please upload a jpg, png, or gif file'
  validates_attachment_size :profile_picture, less_than: 500.kilobytes

  tire do
    settings analysis: {
      analyzer: {
        default: {
          type: :snowball
        }
      }
    }

    mapping do
      indexes :id, type: :integer, index: :not_analyzed
      indexes :first_name, analyzer: :snowball
      indexes :last_name, analyzer: :snowball
      indexes :email, analyzer: :snowball
      indexes :created_at, type: :date

      indexes :categories do
        indexes :id, type: :integer, index: :not_analyzed
        indexes :title, type: :string, index: :not_analyzed
      end
    end
  end

  def to_indexed_json
    to_json(
      methods: [ :profile_pic ],
      include: [ :categories ]
    )
  end

  def profile_pic
    profile_picture.url(:medium)
  end

  def profile_picture_remote_url=(url)
    begin
      self.profile_picture = URI.parse(url)
      @profile_picture_remote_url = url
    rescue Exception => e
      Rails.logger.warn "Error setting profile_picture_remote_url: #{e.message}"
    end
  end

  def self.from_omniauth(auth)
    user = where(auth.slice('provider', 'uid')).first
    # this person has already signed up with facebook, we're all set

    unless user
      already_user = where(email: auth['info']['email']).first

      if already_user
        if auth['info']['verified']
          user = already_user
        else
          return "You already have a Toolbox account. Please verify your Facebook account before connecting them, or sign in with your Toolbox account instead."
        end
      else
        # brand new account, create user
        user = create_from_omniauth(auth)
      end
    end

    return user
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.needs_password_set = true

      user.provider = auth['provider']
      user.uid = auth['uid']
      user.password = user.password_confirmation = SecureRandom.urlsafe_base64
      user.email = auth['info']['email']
      user.facebook_username = auth['extra']['raw_info']['username']
      user.first_name = auth['info']['first_name']
      user.last_name = auth['info']['last_name']

      pic = URI(auth['info']['image'])
      pic.query = 'type=large'
      user.profile_picture_remote_url = pic.to_s

      bio = auth['info']['description']
      user.bio = bio if bio && bio.length <= 200

      nick = auth['info']['nickname']
      user.username = nick if nick.match(/^[\d\w-]+$/) && !User.exists?(username: nick)

      user.new_user = true # This is for mixpanel, so we know to alias
    end
  end

  def self.search(params)
    tire.search(page: params[:page], per_page: 36) do
      # generate the actual
      query do
        if params[:keyword].blank? && params[:category_ids].blank?
          all
        else
          boolean do
            must {string params[:keyword], default_operator: 'AND'} if params[:keyword].present?
            must {terms 'categories.id', params[:category_ids]} if params[:category_ids].present?
          end
        end
      end

      # order the results
      if params[:order] == 'Recently Added'
        sort { by :created_at, 'desc' }
      elsif params[:order] == 'By Name'
        sort do
          by :first_name, :asc
          by :created_at, :desc
        end
      end

      # facets for has_many associations
      facet 'categories' do
        terms :category_id
      end
    end
  end

  def city_name
    city.pretty_name if city
  end

  def city_name=(id)
    self.city = City.find_by_id(id) if id.present?
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def facebook_url
    facebook_username.blank? ? nil : "https://facebook.com/#{facebook_username}"
  end

  def twitter_url
    twitter_username.blank? ? nil : "https://twitter.com/#{twitter_username}"
  end

  def google_plus_url
    google_plus_id.blank? ? nil : "https://plus.google.com/#{google_plus_id}"
  end

  def linkedin_url
    linkedin_username.blank? ? nil : "http://linkedin.com/in/#{linkedin_username}"
  end

  def github_url
    github_username.blank? ? nil : "http://github.com/#{github_username}"
  end

  def formatted_website_url
    nil if self.website_url.blank?

    self.website_url.match(/https?:\/\//) ? self.website_url : "http://#{self.website_url}"
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def to_param
    self.username.blank? ? self.id : self.username
  end

  private

  def downcase_username
    username.downcase! if username
  end

  def validate_password?
    (password.present? || password_confirmation.present? || password == '' || password_confirmation == '')
  end
end
