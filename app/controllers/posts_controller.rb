class PostsController < ApplicationController
    # deviseヘルパー ログインユーザーのみ実行可能
    before_action :authenticate_user!, only: [:new, :create, :destroy] 
    
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
    end
    
    def post_params
      params.require(:post).permit(:album_id, picture:[])
    end
end
