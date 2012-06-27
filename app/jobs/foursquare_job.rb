require 'json'
require 'oauth'

class FoursquareJob
  @queue = :foursquare

  def self.perform(escape_json, client_id, client_secret)
    escape = JSON.parse(escape_json)

    client = Foursquare2::Client.new(:client_id => client_id,
                                     :client_secret => client_secret)

    lat_long = escape["latitude"] + "," + escape["longitude"]

    results = client.search_venues(:ll => lat_long)
    venues = results.groups.first.items
    puts venues.count
    venues.each do |v|
      puts v.name
    end
  end

end

# Hashie format is:
# groups -- array
#   Places -- first thing in array; hash
  #   type -- hashie
  #   name
  #   items
  #     places
