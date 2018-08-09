class MoviesController < ApplicationController
  def index
    render :search
  end

  def search
    @results = SearchMovie.new(params[:movie_name]).search
  end
end
