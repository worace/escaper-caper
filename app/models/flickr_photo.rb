class FlickrPhoto < ActiveRecord::Base
  include AASM

  aasm :column => :current_state do
    state :pending, initial: true
    state :accepted
    state :rejected

    event :accept do
      transitions to: :accepted, from: :pending
    end

    event :reject do
      transitions to: :rejected, from: :pending
    end
  end

  after_create :check_photo

  attr_accessible :url_med, :flickr_id, :title, :escape_id
  validates_presence_of :flickr_id, :url_med
  belongs_to :escape

  def check_photo
    Resque.enqueue(CheckPhoto, self.to_json)
  end
end
