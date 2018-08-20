module AlbumsHelper
  def nil_album?
    @user = User.find_by(friendly_id: params[:user_id])
    !Album.find_by(user_id: @user.id)
  end
end
