require 'spec_helper'

describe FoursquareSpot do
  context "validations" do
    it "requires a foursquare id" do
      spot = FactoryGirl.build(:foursquare_spot, :foursquare_id => "")
      spot.should_not be_valid
    end
    it "requires a name" do
      spot = FactoryGirl.build(:foursquare_spot, :name => "")
      spot.should_not be_valid
    end
    it "requires a foursquare id" do
      spot = FactoryGirl.build(:foursquare_spot, :latitude => "")
      spot.should_not be_valid
    end
    it "requires a foursquare id" do
      spot = FactoryGirl.build(:foursquare_spot, :longitude => "")
      spot.should_not be_valid
    end
  end

  context "#foursquare_link" do
    let(:venue) { FactoryGirl.create(:foursquare_spot) }
    it "returns the link to the venue's page on foursquare" do
      venue.foursquare_link.should == "https://foursquare.com/v/4b05867af964a520856322e3"
    end
  end
end
