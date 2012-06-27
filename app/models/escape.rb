class Escape < ActiveRecord::Base
   attr_accessible :title, :description, :venue, :details,
                   :price, :phone, :street, :city, :state,
                   :zipcode, :expiration, :latitude, :longitude

   after_create :pull_photos

   has_many :flickr_photos
   has_many :foursquare_spots


   def pull_photos
    Resque.enqueue(FlickrJob, self.to_json)
   end
end
