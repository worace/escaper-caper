require 'spec_helper'

describe FoursquareJob do
  FOURSQUARE_TEST_ID = "KTDBLSK4FFIGIOFHNNQDFKXFVDYTEG4BRHW5WDCPBYBVDZ2K"
  FOURSQUARE_TEST_SECRET = "YQC04WEXVF1U2LULZVRNPRMUOEPQXI0XUDWGVRLL1CFZIUGS"

  let(:escape) { FactoryGirl.create(:escape, latitude: "41.3081", longitude: "-72.9286", city: "New Haven", state: "CT") }

  context ".perform" do
    use_vcr_cassette

    before do
      FoursquareJob.perform(escape.to_json, FOURSQUARE_TEST_ID, FOURSQUARE_TEST_SECRET)
    end

    it "pulls down foursquare venues for the escape location" do
      escape.foursquare_spots.count.should == 30
      spot = escape.foursquare_spots.last
    end

    it "adds the categories for the venues" do
      spot = escape.foursquare_spots.last
      spot.categories.count.should > 0
    end
  end
end
