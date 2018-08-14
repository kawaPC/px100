class AlbumsController < ApplicationController
    before_action :load_album, only: [:show, :edit]
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
        @album = current_user.albums.build(album_params)
        unless  @album.cover_picture
            @album.cover_picture = File.open("/assets/images/default_picture.jpg")
        end
        if @album.save
            flash[:notice] = "アルバムを作成しました"
            redirect_to user_albums_path
        else
            flash[:notice] = "保存できませんでした"
            render 'albums/new'
        end
    end
    
    def edit
        @posts = Post.where(album_id: @album.id)
    end
    
    def update
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
            flash[:notice] = "権限がありません"
            redirect_back(fallback_location: root_path)
        end
    end
end