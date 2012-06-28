class Escape < ActiveRecord::Base
   attr_accessible :title, :description, :venue, :details,
                   :price, :phone, :street, :city, :state,
                   :zipcode, :expiration, :latitude, :longitude

   after_create :pull_photos, :pull_attractions

   has_many :flickr_photos
   has_many :foursquare_spots

   def primary_category
    count = {}
    count.default = 0
    foursquare_spots.each do |spot|
      spot.categories.each do |cat|
        if cat.parent_category
          count[cat.parent_category.id] += 1
        end
      end
    end
    count.sort_by { |id, count| count }
    if count.any?
      ParentCategory.find(count.first.first)
    else
      ""
    end
   end

   def pull_photos
    Resque.enqueue(FlickrJob, self.to_json, ENV['FLICKR_KEY'], ENV['FLICKR_SECRET'])
   end

   def pull_attractions
     Resque.enqueue(FoursquareJob, self.to_json, ENV['FOURSQUARE_CLIENT_ID'], ENV['FOURSQUARE_CLIENT_SECRET'])
   end
end
