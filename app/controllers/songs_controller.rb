class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        @artists = Artist.all
        @genres = Genre.all
        erb :'songs/new'
    end

    post '/songs' do
        @song = Song.create(params[:song])
        @song.update(artist_id: Artist.find_or_create_by(name: params[:artist][:name]).id)
        if !params[:genre][:name].empty?
            @song.genres << Genre.create(params[:genre])
        end

        redirect "songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :'songs/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        @song.update(artist_id: Artist.find_or_create_by(name: params[:artist][:name]).id)

        redirect "songs/#{@song.slug}"
    end

end