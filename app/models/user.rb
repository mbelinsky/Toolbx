class User < ActiveRecord::Base
  has_secure_password
  belongs_to :city
  has_many :languages, through: :user_languages
  has_many :user_tools, dependent: :destroy
  has_many :tools, through: :user_tools
  attr_accessible :description, :email, :facebook_username, :linkedin_username, :first_name, :password_digest, :last_name, :twitter_username, :website_url, :password, :password_confirmation, :username

  before_validation :downcase_username

  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, email_format: [message: 'is not a valid email address']

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_format_of :username, with: /^[\d\w-]+$/

  validates :password, length: { minimum: 8 }, if: :validate_password?
  validates :password_confirmation, on: :update, presence: true, if: :validate_password?

  before_create { generate_token(:toolbox_auth_token) }

  has_attached_file :profile_picture, styles: { medium: "140x140>", small: "60x60>", thumb: "30x30>" }, default_url: 'profile-default/missing_:style.png'
  validates_attachment_content_type :profile_picture, content_type: ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/xpng', 'image/gif'], message: 'please upload a jpg, png, or gif file'
  validates_attachment_size :profile_picture, less_than: 1.megabyte


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
    self.username
  end

  private

  def downcase_username
    username.downcase!
  end

  def validate_password?
    (password.present? || password_confirmation.present? || password == '' || password_confirmation == '')
  end
end
