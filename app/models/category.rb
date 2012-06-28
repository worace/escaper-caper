class Category < ActiveRecord::Base
  attr_accessible :icon_url,
                  :name,
                  :plural_name,
                  :short_name,
                  :foursquare_id,
                  :parent,
                  :primary

  after_create :set_parent
  belongs_to :parent_category
  has_many :venue_categories
  has_many :foursquare_spots, through: :venue_categories

  def set_parent
    if self.parent
      parent_cat = ParentCategory.find_or_create_by_name(self.parent)
      self.parent_category = parent_cat
      save
    end
  end
end
