require 'flickraw'
require 'json'

class FlickrJob
  @queue = :flickr

  def self.perform(escape_json, flickr_key, flickr_secret)
    escape = JSON.parse(escape_json)

    FlickRaw.api_key      = flickr_key
    FlickRaw.shared_secret= flickr_secret

    place = flickr.places.findByLatLon(:lat => escape["latitude"], :lon => escape["longitude"], :accuracy => '6')

    #photos = flickr.photos.search(:woe_id => place['woe_id'],
                                  #:media  => 'photos',
                                  #:sort   => 'interestingness-desc',
                                  #:extras => 'url_z')


    radius_photos = flickr.photos.search(:lat => escape["latitude"], :lon => escape["longitude"], :radius => "20", :radius_units => "mi", :sort => "interestingness-desc")
    puts "Radial search found #{radius_photos.count} photos for #{escape["venue"]}!"

    query_string = escape["venue"] + " " + escape["state"]
    keyword_photos = flickr.photos.search(:text => query_string, :sort => "interestingness-desc")
    puts "Keyword search found #{keyword_photos.count} photos for #{escape["venue"]}!"

    #photos.each do |photo|
      #puts photo["url_z"]
    #end

  end
end

