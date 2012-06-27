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

  it "defaults current state to pending" do
    photo = FactoryGirl.create(:flickr_photo)
    photo.current_state.should == "pending"
  end

  it "sets state to accepted when photo is accepted" do
    photo = FactoryGirl.create(:flickr_photo)
    photo.accept
    photo.current_state.should == "accepted"
  end

  it "sets state to rejected when photo is rejected" do
    photo = FactoryGirl.create(:flickr_photo)
    photo.reject
    photo.current_state.should == "rejected"
  end

  it "enqueues the verification job after a photo is created" do
    photo = FactoryGirl.build(:flickr_photo)
    photo.should_receive(:check_photo)
    photo.save
  end
end
