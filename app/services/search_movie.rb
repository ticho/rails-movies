# frozen_string_literal: true

class SearchMovie
  def initialize(movie_name)
    @movie_name = movie_name
    self
  end

  def search
    Tmdb::Api.key(Rails.application.credentials.dig(:movie_key_v3))
    @search = Tmdb::Search.new
    # @search.resource('person') # determines type of resource
    @search.query(@movie_name) # the query to search against
    # @search.fetch # makes request
    @results = []
    @search.fetch.first(20).each do |movie|
      @results.push(Movie.new(
                      movie['title'],
                      movie['release_date'],
                      Tmdb::Movie.credits(movie['id'])['crew'].select { |x| x['job'] == 'Director' }[0]['name'],
                      'https://image.tmdb.org/t/p/w220_and_h330_bestv2' + movie['poster_path']
                    ))
    rescue StandardError => e
      puts e.message
    end
    @results
  end
end
