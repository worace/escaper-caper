require 'spec_helper'

describe VenueCategory do
  context "validations" do
    it "requires a category id and a foursquare_spot id" do
      vc = VenueCategory.new
      vc.should_not be_valid

      vc.category_id = 1
      vc.should_not be_valid

      vc.foursquare_spot_id = 1
      vc.should be_valid
    end
  end
end
