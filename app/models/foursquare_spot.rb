class FoursquareSpot < ActiveRecord::Base
  belongs_to :escape
  attr_accessible :name,
                  :foursquare_id,
                  :longitude,
                  :latitude,
                  :checkins,
                  :tips,
                  :url

  validates_presence_of :foursquare_id, :name, :latitude, :longitude

end
