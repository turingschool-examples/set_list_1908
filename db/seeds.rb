artist_1 = Artist.create(name: "Talking Heads")
artist_2 = Artist.create(name: "Prince")
artist_3 = Artist.create(name: "Zac Brown Band")

artist_1.songs.create(title: "And She Was", play_count: 23, length: 234)
artist_1.songs.create(title: "Wild Wild Life", play_count: 894, length: 456)

artist_2.songs.create(title: "Raspberry Beret", play_count: 434, length: 340)
