class PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
  end

  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path(@post_image.id)
  end

  def index
    @post_image = PostImage.all
  end

  def show
    @post_images = PostImage.find(params[:id])
  end

  def destroy
    @post_images = PostImage.find(params[:id])
    @post_images.destroy
    redirect_to '/post_images'
  end

  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
