class Category < ActiveRecord::Base
  attr_accessible :icon_url,
                  :name,
                  :plural_name,
                  :short_name,
                  :foursquare_id,
                  :parent,
                  :primary

  has_many :venue_categories
  has_many :foursquare_spots, through: :venue_categories
end
