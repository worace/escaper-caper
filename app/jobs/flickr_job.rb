require 'flickraw'
require 'json'

class FlickrJob
  @queue = :flickr

  def self.perform(escape_json, flickr_key, flickr_secret)
    escape = JSON.parse(escape_json)

    FlickRaw.api_key      = flickr_key
    FlickRaw.shared_secret= flickr_secret

    radius_photos = flickr.photos.search(:lat          => escape["latitude"],
                                         :lon          => escape["longitude"],
                                         :radius       => "20",
                                         :radius_units => "mi",
                                         :sort         => "interestingness-desc",
                                         :extras       => "url_z") # include the medium-size image url in results


    query_string = escape["venue"] + " " + escape["state"]

    keyword_photos = flickr.photos.search(:text        => query_string,
                                          :sort        => "interestingness-desc",
                                          :extras      => "url_z")
  end
end

