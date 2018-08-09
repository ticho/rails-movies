class Movie
  attr_accessor :title, :release_date, :director, :img

  def initialize(title, release_date = '', director = '', img = '')
    @title = title
    @release_date = release_date
    @director = director
    @img = img
  end
end