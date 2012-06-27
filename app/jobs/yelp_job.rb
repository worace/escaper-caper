require 'json'
require 'oauth'

class YelpJob
  @queue = :yelp

  def self.perform(escape_json, yelp_consumer_key, yelp_consumer_secret, yelp_token, yelp_token_secret, ywsid )
    client = Yelp::Client.new
    escape = JSON.parse(escape_json)

    consumer = OAuth::Consumer.new(yelp_consumer_key, yelp_consumer_secret, {:site => "http://api.yelp.com"})
    access_token = OAuth::AccessToken.new(consumer, yelp_token, yelp_token_secret)

    path = "/v2/search?term=restaurants&location=new%20york"

    result = access_token.get(path).body

    #query1 = Yelp::V1::Review::Request::Location.new(
      #:city => escape[:city],
      #:state => escape[:state],
      #:category => ['pizza'],
      #:yws_id  => ywsid
    #)

    #query = Yelp::V2::Search::Request::Location.new(
      #:term => "restaurant",
      #:city => escape[:city],
      #:state => escape[:state],
      #:consumer_key => yelp_consumer_key,
      #:consumer_secret => yelp_consumer_secret,
      #:token => yelp_token,
      #:token_secret => yelp_token_secret
    #)

    #result = client.search(query1)

    puts result.inspect
  end
end

