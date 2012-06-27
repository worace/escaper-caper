require 'spec_helper'

describe FoursquareJob do
  let(:escape) { FactoryGirl.create(:escape, latitude: "41.3081", longitude: "-72.9286", city: "New Haven", state: "CT") }

  context ".perform" do
    use_vcr_cassette

    before do
      FoursquareJob.perform(escape.to_json, ENV['FOURSQUARE_CLIENT_ID'], ENV['FOURSQUARE_CLIENT_SECRET'])
    end

    it "pulls down foursquare venues for the escape location" do
      escape.foursquare_spots.count.should == 30
      spot = escape.foursquare_spots.last

      spot.name.should == "Yale University - Jonathan Edwards College"
      spot.latitude.should == "41.309029"
      spot.longitude.should == "-72.93006"
      spot.foursquare_id.should == "4b4e28e1f964a5207fe326e3"
    end

    it "adds the categories for the venues" do
      spot = escape.foursquare_spots.last
      spot.categories.count.should > 0
    end
  end
end
