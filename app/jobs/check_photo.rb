require 'net/http'
require 'uri'

class CheckPhoto
  @queue = :photo_checker

  def self.perform(photo_json, connection = Faraday.new(:url => "http://vivid-stone-5008.herokuapp.com"))
    puts "performing check photo job"
    photo = JSON.parse(photo_json)

    puts photo['url_med']

    connection.get do |req|
      req.url "/photo/test"
      req.params['url'] = photo['url_med']
    end
  end
end
