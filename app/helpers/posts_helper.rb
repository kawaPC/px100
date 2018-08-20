module PostsHelper
  def nil_post?
    !Post.find_by(album_id: session[:album])
  end
end
