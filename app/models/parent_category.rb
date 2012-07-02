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

  attr_accessible :name, :display_name
  has_many :categories


  validates_presence_of :name

  def display_name
    DISPLAY_NAMES[name]
  end
end
