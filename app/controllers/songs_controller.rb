class SongController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/") }
  
    get '/songs' do
        @songs = Song.all
        erb :'index/songs'
    end

    get '/songs/new' do

        erb :'songs/new'
    end

    post '/songs' do
        @name = params[:song_title]
        @artist_id = Artist.all.find_by(name: params[:artist_name]).id
        Song.create(name: @name, artist_id: @artist_id)
        erb :'songs/index'
    end

  end