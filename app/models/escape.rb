class Escape < ActiveRecord::Base
   attr_accessible :title, :description, :venue, :details,
                   :price, :phone, :street, :city, :state,
                   :zipcode, :expiration, :latitude, :longitude,
                   :livingsocial_url, :livingsocial_id


   after_create :pull_photos, :pull_attractions

   has_many :flickr_photos
   has_many :foursquare_spots

   def checkout_url
     if self.livingsocial_id
       "https://www.livingsocial.com/deals/#{self.livingsocial_id}/checkout/new"
     else
      "http://livingsocial.com/escapes"
     end
   end

   def original_url
     return livingsocial_url if livingsocial_url
     "http://livingsocial.com/escapes"
   end

   def parent_category
     return cached_category if cached_category
     counts = category_counts
     if counts.any?
       pc = ParentCategory.find(counts.first.first)
       set_cached_category(pc)
       return pc
     else
       pc = ParentCategory.last
       set_cached_category(pc)
       return pc
     end
   end

   def category_counts
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
     count
   end

   def picker_cache_key
     "escape:#{self.id}"
   end

   def cached_category
     ParentCategory.find_by_id(PickerCache.cat_id(picker_cache_key))
   end

   def set_cached_category(cat)
     PickerCache.set_cat_id(picker_cache_key, cat.id.to_s)
   end

   def pull_photos
    Resque.enqueue(FlickrJob, self.to_json, ENV['FLICKR_KEY'], ENV['FLICKR_SECRET'])
   end

   def pull_attractions
     Resque.enqueue(FoursquareJob, self.to_json, ENV['FOURSQUARE_CLIENT_ID'], ENV['FOURSQUARE_CLIENT_SECRET'])
   end
end
