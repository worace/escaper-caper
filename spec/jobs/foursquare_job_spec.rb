require 'spec_helper'

describe FoursquareJob do
  let(:escape) { FactoryGirl.create(:escape, latitude: "41.3081", longitude: "-72.9286", city: "New Haven", state: "CT") }

  context ".perform" do
    use_vcr_cassette(:record => :all)

    it "pulls down foursquare venues for the escape location" do
      FoursquareJob.perform(escape.to_json, ENV['FOURSQUARE_CLIENT_ID'], ENV['FOURSQUARE_CLIENT_SECRET'])
      escape.foursquare_spots.count.should == 30
      spot = escape.foursquare_spots.last

      spot.name.should == "Yale Center for British Art"
      spot.url.should == "http://britishart.yale.edu"
      spot.latitude.should == "41.307837"
      spot.longitude.should == "-72.930478"
      spot.foursquare_id.should == "4b05867af964a520856322e3"
    end
  end
end
