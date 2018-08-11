User.create(name: 'kawamoto', email: 'kawamoto1@example.com', password: 'password', friendly_id: 'kawamoto')
User.create(name: 'kawa2', email: 'kawamoto2@example.com', password: 'password' , friendly_id: 'kawamoto2')
User.create(name: 'kawa3', email: 'kawamoto3@example.com', password: 'password', friendly_id: 'kawamoto3')
User.create(name: 'kawa4', email: 'kawamoto4@example.com', password: 'password', friendly_id: 'kawamoto4')

Album.create(user_id: 1, album_name: 'Tokyo')
Album.create(user_id: 1, album_name: 'Kyoto')
Album.create(user_id: 1, album_name: 'Hiroshima')
Album.create(user_id: 1, album_name: 'Nagano')
Album.create(user_id: 1, album_name: 'Tohoku')

30.times do
  Post.create(
      user_id: 1,
      album_id: 5,
      picture: File.open("./public/sample/album/023.jpg")
      )
end