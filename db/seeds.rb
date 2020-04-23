Artist.destroy_all
Genre.destroy_all
Song.destroy_all
SongGenre.destroy_all

10.times do 
    Artist.create(name: Faker::Music::RockBand.name)
end 

10.times do 
    Genre.create(name: Faker::Music.genre)
end 

10.times do 
    Song.create(name: Faker::Music.album, artist_id: Artist.all.sample.id)
end 

10.times do 
    SongGenre.create(song_id: Song.all.sample.id, genre_id: Genre.all.sample.id)
end 









