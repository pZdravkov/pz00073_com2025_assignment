class Song
  attr_accessor :title, :artist, :url
  
  def initialize(attributes = {})
    @title = attributes[:title]
    @artist = attributes[:artist]
    @url = attributes[:url]
  end
   