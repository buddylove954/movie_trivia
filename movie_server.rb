require 'imdb'
require 'sinatra'
require 'pry'

get '/' do
erb :movies 
end

post '/movies' do 
@i = Imdb::Search.new(params[:movie])
erb :list_movies	
end
