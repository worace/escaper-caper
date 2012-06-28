class ParentCategory < ActiveRecord::Base
  attr_accessible :name, :display_name
  has_many :categories

  validates_presence_of :name
end
