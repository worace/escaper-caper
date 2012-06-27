require 'net/http'
require 'uri'

class CheckPhoto
  @queue = :photo_checker

  def self.perform(photo_json, connection = Faraday.new(:url => "http://vivid-stone-5008.herokuapp.com"))
    photo = JSON.parse(photo_json)

    connection.get do |req|
      req.url "/photo/test"
      req.params['url'] = photo['url_med']
    end
  end
end
