class AlbumsController < ApplicationController
  before_action :load_album, only: [:show, :edit]
  before_action :correct_user, only: [:new, :edit, :delete, :create, :destroy, :update]

  def index
    @user = User.find_by(friendly_id: params[:user_id])
    session[:album_user] = @user.id
    if @user == current_user && Album.find_by(user_id: @user.id) == nil
      redirect_to new_user_album_path
    end
    @albums = Album.where(user_id: @user.id)
    session[:album] = nil
  end

  def show
    session[:album] = @album.id
    @posts = Post.where(album_id: @album.id)
  end

  def horizontal
    @posts = Post.where(album_id: session[:album])
  end

  def vartical
    @posts = Post.where(album_id: session[:album])
  end

  def chess
    @posts = Post.where(album_id: session[:album])
  end

  def new
    @album = Album.new
    @user = User.find_by(friendly_id: params[:user_id])
    @albums = Album.where(user_id: @user.id)
  end

  def create
    @album = current_user.albums.build(album_params)
    unless @album.cover_picture
      @album.cover_picture = File.open("/assets/images/default_picture.jpg")
    end
    if @album.save
      flash[:notice] = "アルバムを作成しました"
      redirect_to user_albums_path
    else
      flash[:notice] = "保存できませんでした"
      redirect_to user_albums_path
    end
  end

  def select
    @user = User.find_by(id: session[:album_user])
    redirect_to user_albums_path(@user) unless Album.find_by(user_id: @user.id)
    @albums = Album.where(user_id: @user.id)
  end

  def delete
    @user = User.find_by(id: session[:album_user])
    redirect_to user_albums_path(@user) unless Album.find_by(user_id: @user.id)
    @albums = Album.where(user_id: @user.id)
  end

  def destroy
    Album.find(params[:id]).destroy
    flash[:notice] = "削除しました"
    redirect_back(fallback_location: user_albums_path)
  end

  def edit
    @user = User.find_by(id: session[:album_user])
    @album = Album.find_by(album_name: params[:album])
  end

  def update
    @album = Album.find_by(album_name: params[:id])
    if @album.update(album_params)
      flash[:notice] = "アルバムを変更しました"
      redirect_to user_albums_path(current_user)
    else
      flash[:notice] = "アルバムを変更できませんでした"
      render 'edit'
    end
  end

  private

  def load_album
    @album = Album.find_by(album_name: params[:id])
  end

  def album_params
    params.require(:album).permit(:album_name, :cover_picture)
  end

  def correct_user
    @user = User.find_by(friendly_id: params[:user_id])
    unless session[:album_user] == current_user.id
      flash[:notice] = "権限がありません"
      redirect_back(fallback_location: root_path)
    end
  end
end