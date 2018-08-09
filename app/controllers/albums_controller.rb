class AlbumsController < ApplicationController
    before_action :load_album, only: [:show]
    
    def index
        @albums = Album.where(user_id: current_user.id)
        session[:album] = nil
    end
    
    def show
        session[:album] = @album.id
    end
    
    def new
    end
    
    private
    
    def load_album
    @album = Album.find_by(album_name: params[:id])
    end
end