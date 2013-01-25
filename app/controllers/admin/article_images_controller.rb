class Admin::ArticleImagesController < AdminController
  def index
    @article_images = ArticleImage.all

    render json: json_images(@article_images), status: 200
  end

  def create
    @article_image = ArticleImage.new(image: params[:file])

    if @article_image.save
      render json: {thumb: @article_image.image.url(:thumb), filelink: @article_image.image.url(:full)}, status: 201
    else
      render json: {error: @article_image.errors.full_messages.first}, status: 400
    end
  end

  private

  def json_images(images)
    json_images = []

    images.each do |image|
      json_images << {
        thumb: image.image.url(:thumb),
        image: image.image.url(:full)
      }
    end

    json_images
  end
end
