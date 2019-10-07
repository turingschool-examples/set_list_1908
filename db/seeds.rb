artist_1 = Artist.create(name: "Taylor Swift")
artist_2 = Artist.create(name: "Carly Rae Jepsen")
artist_3 = Artist.create(name: "Justin Bieber")

artist_1.songs.create(title: "Lover", play_count: 25000, length: 80)
artist_1.songs.create(title: "You Need to Calm Down", play_count: 50000, length: 90)
artist_1.songs.create(title: "ME!", play_count: 75000, length: 120)

artist_2.songs.create(title: "Call Me Maybe", play_count: 26000, length: 81)
artist_2.songs.create(title: "Party for One", play_count: 56000, length: 91)
artist_2.songs.create(title: "Cut to the Feeling", play_count: 76000, length: 71)

artist_3.songs.create(title: "Sorry", play_count: 27000, length: 82)
artist_3.songs.create(title: "Love Yourself", play_count: 57000, length: 92)
artist_3.songs.create(title: "What Do You Mean?", play_count: 77000, length: 72)
