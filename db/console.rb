require('pry')
require_relative('../models/artist')
require_relative('../models/album')
Album.delete_all()
Artist.delete_all()


artist1 = Artist.new({"artist_name" => "Aretha Franklin"})
artist2 = Artist.new({"artist_name" => "Marvin Gaye"})
artist3 = Artist.new({"artist_name" => "MGMT"})
artist4 = Artist.new({"artist_name" => "The Strokes"})
artist5 = Artist.new({"artist_name" => "Taylor Swift"})
artist6 = Artist.new({"artist_name" => "Bob Dylan"})
artist1.save()
artist2.save()
artist3.save()
artist4.save()
artist5.save()

album1 = Album.new({
  "album_name" => "I Never Loved a Man the Way I Love You",
  "genre" => "Motown",
  "artist_id" => artist1.id
  })
  album1.save()
  album2 = Album.new({
    "album_name" => "What's Goin' On",
    "genre" => "Motown",
    "artist_id" => artist2.id
    })
    album2.save()
    album6 = Album.new({
      "album_name" => "Let's Get It On",
      "genre" => "Motown",
      "artist_id" => artist2.id
      })
      album6.save()
      album3 = Album.new({
        "album_name" => "Oracular Spectacular",
        "genre" => "Psychodelic",
        "artist_id" => artist3.id
        })
        album3.save()
        album4 = Album.new({
          "album_name" => "Is This It",
          "genre" => "Rock",
          "artist_id" => artist4.id
          })
          album4.save()
          album5 = Album.new({
            "album_name" => "1989",
            "genre" => "Pop",
            "artist_id" => artist5.id
            })
            album5.save()
            album1.update #("Blowin in the Wind", "Folk", artist6.id)
            #  album1.save()
            album1.delete()


    # Album.find(artist1.id)
            binding.pry
            nil
