class VenueCategory < ActiveRecord::Base
  belongs_to :foursquare_spot
  belongs_to :category
  validates_presence_of :category_id, :foursquare_spot_id
  validates_uniqueness_of :category_id, :scope => :foursquare_spot_id
end
