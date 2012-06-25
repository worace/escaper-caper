class FlickrPhoto < ActiveRecord::Base
  attr_accessible :url_med, :flickr_id, :title, :escape_id
  belongs_to :escape
end
