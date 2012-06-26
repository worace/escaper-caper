require 'spec_helper'

describe FlickrPhoto do
  it "prevents creation of an item without a url" do
    photo = FactoryGirl.build(:flickr_photo, url_med: "", flickr_id: "12345")
    photo.should_not be_valid
  end

  it "prevents creation of an item without a flickr id" do
    photo = FactoryGirl.build(:flickr_photo, url_med: "http://flickr.com/12345", flickr_id: "")
    photo.should_not be_valid
  end
end
