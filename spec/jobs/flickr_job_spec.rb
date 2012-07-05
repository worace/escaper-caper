require 'spec_helper'

describe FlickrJob do
  FLICKR_TEST_KEY = "918246d619613f5e913d8ee51d8d18a4"
  FLICKR_TEST_SECRET = "f7636e1dbf57f311"

  let(:escape) { FactoryGirl.create(:escape, latitude: "41.3081", longitude: "-72.9286", city: "New Haven", state: "CT") }

  context ".perform" do
    use_vcr_cassette

    it "pulls down flickr items for the given escape" do
      FlickrJob.perform(escape.to_json, FLICKR_TEST_KEY, FLICKR_TEST_SECRET)
      escape.flickr_photos.count.should == 3
    end

    it "filters out duplicate photos" do
      FlickrJob.perform(escape.to_json, FLICKR_TEST_KEY, FLICKR_TEST_SECRET)
      escape.flickr_photos.count.should == 3

      FlickrJob.perform(escape.to_json, FLICKR_TEST_KEY, FLICKR_TEST_SECRET)
      escape.flickr_photos.count.should == 3
    end
  end
end
