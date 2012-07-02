class FoursquareSpot < ActiveRecord::Base
  belongs_to :escape
  attr_accessible :name,
                  :foursquare_id,
                  :longitude,
                  :latitude,
                  :checkins,
                  :tips,
                  :url

  has_many :venue_categories
  has_many :categories, through: :venue_categories

  validates_presence_of :foursquare_id, :name, :latitude, :longitude

  def foursquare_link
    "https://foursquare.com/v/#{foursquare_id}"
  end
end
