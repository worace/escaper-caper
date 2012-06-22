class Escape < ActiveRecord::Base
   attr_accessible :title, :description, :venue, :details,
                   :price, :phone, :street, :city, :state,
                   :zipcode, :expiration, :latitude, :longitude

   after_create :pull_photos


   def pull_photos
    Resque.enqueue(FlickrJob, self.to_json)
   end
end
