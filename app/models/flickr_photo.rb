class FlickrPhoto < ActiveRecord::Base
  attr_accessible :url_med, :flickr_id, :title, :escape_id
  validates_presence_of :flickr_id, :url_med
  belongs_to :escape
end
