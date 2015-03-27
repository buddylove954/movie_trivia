require 'imdb'
require 'sinatra'
require 'pry'

class Movie
	def search(word)
      searched_movies = Imdb::Search.new(word).movies
      random_movies = searched_movies.first(30)
      movies = random_movies.map{|m|
        {title: m.title,poster: m.poster}
      }
  	end
end

get '/' do
erb :movies 
end

post '/list_movies' do
  @movies = Movie.new.search(params[:movie])
  erb :list_movies
end

*
