
class SongsController < ApplicationController

    get "/songs" do
        @songs = Song.all 
        erb :'songs/index'
    end 



    get "/songs/new" do
        @song = Song.new
        @artists = Artist.all
        @genres = Genre.all
        erb :"songs/new"
    end 
    
    post "/songs" do 
        @song = Song.create(params[:song])
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.genre_ids = params[:genres]
        @song.save
        flash[:message] = "Successfully created song."
        redirect("/songs/#{@song.slug}")
    end 
        
    get "/songs/:slug" do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end 

    get "/songs/:slug/edit" do
        @song = Song.find_by_slug(params[:slug])
        @artists = Artist.all
        @genres = Genre.all
        erb :"songs/edit"
    end 

    patch "/songs/:slug" do #edit action
        # binding.pry
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        @song.artist.update(params[:artist])
        @song.genre_ids = params[:genres]
        @song.save
        redirect to "/songs/#{@song.slug}"
    end 

end