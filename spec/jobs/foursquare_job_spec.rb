require 'spec_helper'

describe FoursquareJob do
  let(:escape) { FactoryGirl.create(:escape, latitude: "41.3081", longitude: "-72.9286", city: "New Haven", state: "CT") }

  context ".perform" do
    use_vcr_cassette(:record => :all)

    it "pulls down foursquare venues for the escape location" do
      FoursquareJob.perform(escape.to_json, ENV['FOURSQUARE_CLIENT_ID'], ENV['FOURSQUARE_CLIENT_SECRET'])
      escape.foursquare_spots.count.should == 30
    end
  end
end
