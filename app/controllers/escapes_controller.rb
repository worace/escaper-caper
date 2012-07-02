class EscapesController < ApplicationController
  def index
    @escapes = Escape.all
  end

  def show
    @escape = Escape.find_by_id(params[:id])
    @flickr_photos = @escape.flickr_photos
    @foursquare_spots = @escape.foursquare_spots
    @items = (@flickr_photos + @foursquare_spots).shuffle
  end
end
