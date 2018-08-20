User.create(name: 'kawamoto', email: 'sample100px@example.com', password: 'sample100114514')

Album.create(user_id: 1, album_name: 'Yamaguchi', cover_picture: File.open("./app/assets/sample/yamaguchi/yamaguchi054.jpg"))
Album.create(user_id: 1, album_name: 'Tokyo', cover_picture: File.open("./app/assets/sample/tokyo/tokyo137.jpg"))
Album.create(user_id: 1, album_name: 'Kamakura', cover_picture: File.open("./app/assets/sample/kamakura/kamakura005.jpg"))
Album.create(user_id: 1, album_name: 'Film', cover_picture: File.open("./app/assets/sample/film/film007.jpg"))
Album.create(user_id: 1, album_name: 'Bento', cover_picture: File.open("./app/assets/sample/bento/bento007.jpg"))
Album.create(user_id: 1, album_name: 'Kyoto', cover_picture: File.open("./app/assets/sample/kyoto/kyoto089.jpg"))

1.upto(55) do |num|
  num = "%03d" % num
  Post.create(
      user_id: 1,
      album_id: 1,
      picture: File.open("./app/assets/sample/yamaguchi/yamaguchi#{num}.jpg")
  )
end

1.upto(212) do |num|
  num = "%03d" % num
  Post.create(
      user_id: 1,
      album_id: 2,
      picture: File.open("./app/assets/sample/tokyo/tokyo#{num}.jpg")
  )
end

1.upto(31) do |num|
  num = "%03d" % num
  Post.create(
      user_id: 1,
      album_id: 3,
      picture: File.open("./app/assets/sample/kamakura/kamakura#{num}.jpg")
  )
end

1.upto(21) do |num|
  num = "%03d" % num
  Post.create(
      user_id: 1,
      album_id: 4,
      picture: File.open("./app/assets/sample/film/film#{num}.jpg")
  )
end

1.upto(64) do |num|
  num = "%03d" % num
  Post.create(
      user_id: 1,
      album_id: 5,
      picture: File.open("./app/assets/sample/bento/bento#{num}.jpg")
  )
end

1.upto(89) do |num|
  num = "%03d" % num
  Post.create(
      user_id: 1,
      album_id: 6,
      picture: File.open("./app/assets/sample/kyoto/kyoto#{num}.jpg")
  )
end
