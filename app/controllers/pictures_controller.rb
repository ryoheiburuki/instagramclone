class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :you_cannot_post, only: [:new, :edit, :show, :destroy]
  # before_action :set_favorite, only: [:show]

  def index
    @picture = Picture.all
    if logged_in?
      @favorite = current_user.favorites
    end
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if @picture.save
      InstaMailer.insta_mailer(@picture).deliver
      redirect_to pictures_path, notice: '写真を投稿しました'
    else
      render "new"
    end

  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: '文章を編集しました'
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: '写真を削除しました'
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:sentence, :image_url_cache, :image_url, :user_id)
  end

  def you_cannot_post
    unless logged_in?
      redirect_to new_session_path
    end
  end

end
