User.create(name: 'sample', email: 'sample100px@example.com', password: 'sample100114514', friendly_id: 'sample')
User.create(name: 'pochi', email: 'kawamoto.hp0@gmail.com', password: 'password', friendly_id: 'kawamoto')
User.create(name: 'kawamoto', email: 'kawamoto1@example.com', password: 'password', friendly_id: 'kawamoto')
User.create(name: 'kawa2', email: 'kawamoto2@example.com', password: 'password' , friendly_id: 'kawamoto2')
User.create(name: 'kawa3', email: 'kawamoto3@example.com', password: 'password', friendly_id: 'kawamoto3')
User.create(name: 'kawa4', email: 'kawamoto4@example.com', password: 'password', friendly_id: 'kawamoto4')

Album.create(user_id: 1, album_name: 'Tokyo', cover_picture: File.open("./app/assets/images/default_picture.jpg"))
Album.create(user_id: 1, album_name: 'Kyoto', cover_picture: File.open("./app/assets/images/default_picture.jpg"))
Album.create(user_id: 1, album_name: 'Hiroshima', cover_picture: File.open("./app/assets/images/default_picture.jpg"))
Album.create(user_id: 1, album_name: 'Nagano', cover_picture: File.open("./app/assets/images/default_picture.jpg"))
Album.create(user_id: 1, album_name: 'Tohoku', cover_picture: File.open("./app/assets/images/default_picture.jpg"))

30.times do
  Post.create(
      user_id: 1,
      album_id: 5,
      picture: File.open("./app/assets/images/default_picture.jpg")
      )
end