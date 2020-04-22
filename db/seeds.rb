Artist.destroy_all
Genre.destroy_all
Song.destroy_all
SongGenre.destroy_all

a1 = Artist.create(name: "Adele")
a2 = Artist.create(name: "Drake")

s1 = Song.create(name: "Rolling in the Deep")
s2 = Song.create(name: "Hello")
s3 = Song.create(name: "Someone Like You")
s4 = Song.create(name: "Hotling Bling")
s5 = Song.create(name: "All of the Lights")

g1 = Genre.create(name: "Rap")
g2 = Genre.create(name: "Pop")
g3 = Genre.create(name: "Soul")

sg1 = SongGenre.create(song_id: s1.id, genre_id: g2.id)
sg2 = SongGenre.create(song_id: s1.id, genre_id: g3.id)
sg3 = SongGenre.create(song_id: s2.id, genre_id: g2.id)
sg4 = SongGenre.create(song_id: s3.id, genre_id: g2.id)
sg5 = SongGenre.create(song_id: s3.id, genre_id: g3.id)
sg6 = SongGenre.create(song_id: s4.id, genre_id: g2.id)
sg7 = SongGenre.create(song_id: s5.id, genre_id: g1.id)
sg8 = SongGenre.create(song_id: s4.id, genre_id: g2.id)

s1.update(artist_id: a1.id)
s2.update(artist_id: a1.id)
s3.update(artist_id: a1.id)
s4.update(artist_id: a2.id)
s5.update(artist_id: a2.id)