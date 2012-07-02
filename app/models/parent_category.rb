class ParentCategory < ActiveRecord::Base
  DISPLAY_NAMES = {"Food" => "Food & Dining",
                   "Nightlife Spots" => "Bars & Nightlife",
                   "Great Outdoors" => "Outdoors",
                   "Travel & Transport" => "International",
                   "Shops & Services" => "Shopping",
                   "Professional & Other Places" => "City Living",
                   "Colleges & Universities" => "College Life",
                   "Arts & Entertainment" => "Arts & Entertainment",
                   "Residences" => "Home Life"}

  ICON_URLS = {"Food" => "https://foursquare.com/img/categories/food/default_256.png",
               "Nightlife Spots" => "https://foursquare.com/img/categories/nightlife/default_256.png",
               "Great Outdoors" => "https://foursquare.com/img/categories/parks_outdoors/default_256.png",
               "Travel & Transport" => "https://foursquare.com/img/categories/travel/default_256.png",
               "Shops & Services" => "https://foursquare.com/img/categories/shops/default_256.png",
               "Professional & Other Places" => "https://foursquare.com/img/categories/building/default_256.png",
               "Colleges & Universities" => "https://foursquare.com/img/categories/education/default_256.png",
               "Arts & Entertainment" => "https://foursquare.com/img/categories/arts_entertainment/default_256.png",
               "Residences" => "https://foursquare.com/img/categories/building/home_256.png"}

  attr_accessible :name, :display_name
  has_many :categories


  validates_presence_of :name

  def display_name
    DISPLAY_NAMES[name]
  end

  def icon_url
    ICON_URLS[name]
  end
end
