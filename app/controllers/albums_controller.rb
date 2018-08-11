class AlbumsController < ApplicationController
    before_action :load_album, only: [:show]
    before_action :correct_user, only: [:new]
    
    def index
        @user = User.find_by(friendly_id: params[:user_id])
        @albums = Album.where(user_id: @user.id)
        session[:album] = nil
    end
    
    def show
        session[:album] = @album.id
        @posts = Post.where(album_id: @album.id)
    end
    
    def new
        @album = Album.new
    end
    
    def create
        
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
        unless @user == current_user
            flash.now[:notice] = "権限がありません"
            redirect_to(root_path)
        end
    end
end