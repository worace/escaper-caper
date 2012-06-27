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

    venues.each do |venue|
      attrs = {}
      attrs[:name]           = venue.name
      attrs[:foursquare_id]  = venue.id
      attrs[:latitude]       = venue.location.lat.to_s
      attrs[:longitude]      = venue.location.lng.to_s
      attrs[:checkins]       = venue.stats.checkinsCount
      attrs[:tips]           = venue.stats.tipCount
      attrs[:url]            = venue.url

      FoursquareSpot.find_or_create_by_foursquare_id_and_escape_id(attrs[:foursquare_id],
                                                                   escape["id"],
                                                                   attrs)
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
