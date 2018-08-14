class PostsController < ApplicationController
    # deviseヘルパー ログインユーザーのみ実行可能
    # before_action :authenticate_user!, only: [:new, :create, :destroy]
    before_action :correct_user, only: [:new, :create, :destroy]
    
    def show
    end
    
    def new
      @post = Post.new
      @album = Album.find_by(id: session[:album])
    end
    
    def create
      @album = Album.find_by(id: session[:album])
      params[:post][:picture].each do |picture|
        Post.create(  user_id: current_user.id,
                      album_id: @album.id,
                      picture: picture
        )
      end
        redirect_to user_album_path(id: @album.album_name)
    end
    
    def destroy
      @user = User.find_by(friendly_id: params[:user_id])
      @album = Album.find_by(id: session[:album])
      Post.find(params[:id]).destroy
      flash[:notice] = "削除しました"
      redirect_to "/#{@user.friendly_id}/albums/#{@album.album_name}/edit"
    end
    
    private
    
    def post_params
      params.require(:post).permit(picture:[])
    end
    
    def correct_user
      @user = User.find_by(friendly_id: params[:user_id])
      unless @user == current_user
        flash[:notice] = "権限がありません"
        redirect_to(root_path)
      end
    end
end
