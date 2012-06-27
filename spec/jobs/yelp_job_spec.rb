require 'spec_helper'

describe YelpJob do
  let(:escape) { FactoryGirl.create(:escape, latitude: "41.3081", longitude: "-72.9286", city: "New Haven", state: "CT") }

  context ".perform" do
    use_vcr_cassette(:record => :all)

    #it "returns yelp listings for the escape location" do
      #YelpJob.perform(escape.to_json, ENV['YELP_KEY'], ENV['YELP_SECRET'], ENV['YELP_TOKEN'], ENV['YELP_TOKEN_SECRET'], ENV['YWSID'])
    #end
  end
end
