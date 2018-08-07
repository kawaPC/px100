class PostsController < ApplicationController
    # deviseヘルパー ログインユーザーのみ実行可能
    before_action :authenticate_user!, only: [:create, :destroy]
    
    def create
        @album = Album.find_by(album_id: params[:id])
        @post = @album.posts.build(post_params)
        @post.user_id = current_user.id
        if @post.save
          flash[:success] = "Micropost created!"
          redirect_to root_url
        else
          render 'static_pages/home'
        end
    end
    
    def destroy
    end
end
