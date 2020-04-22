class Artist < ActiveRecord::Base
    has_many :songs

    def genres
        self.songs.map {|song| song.genres }.flatten.uniq
    end
end