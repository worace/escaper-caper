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

      spot = FoursquareSpot.find_or_create_by_foursquare_id_and_escape_id(attrs[:foursquare_id],
                                                                   escape["id"],
                                                                   attrs)
      venue.categories.each do |category|
        attrs ={}
        attrs[:foursquare_id] = category.id
        attrs[:name] = category.name
        attrs[:plural_name] = category.pluralName
        attrs[:short_name] = category.shortName
        attrs[:primary] = category.primary
        attrs[:icon_url] = category.icon
        attrs[:parent]   = category.parents.first
        cat = Category.find_or_create_by_foursquare_id(attrs[:foursquare_id], attrs)

        unless spot.categories.include?(cat)
          spot.categories << cat
        end

      end
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
