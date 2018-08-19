class PostsController < ApplicationController
    # deviseヘルパー ログインユーザーのみ実行可能
    # before_action :authenticate_user!, only: [:new, :create, :destroy]
    before_action :correct_user, only: [:new, :create, :destroy]
    before_action :current_album
    
    def index
      @album = Album.find_by(album_name: params[:album_id])
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
    
    def show
    end
    
    def new
      @user = User.find_by(friendly_id: params[:use_id])
      @post = Post.new
    end
    
    def create
      params[:post][:picture].each do |picture|
        Post.create(  user_id: current_user.id,
                      album_id: @album.id,
                      picture: picture
        )
      end
        redirect_to user_albums_path
    end
    
    def edit
      @posts = Post.where(album_id: @album.id)
      @user = User.find_by(id: @album.user_id)
    end
    
    def destroy
      Post.find(params[:id]).destroy
      flash[:notice] = "削除しました"
      redirect_back(fallback_location: user_albums_path)
    end
    
    private
    
    def post_params
      params.require(:post).permit(picture:[])
    end
    
    def current_album
      @album = Album.find_by(id: session[:album])
    end
    
    def correct_user
      @user = User.find_by(friendly_id: params[:user_id])
      unless @user == current_user
        flash[:notice] = "権限がありません"
        redirect_to(root_path)
      end
    end
end
