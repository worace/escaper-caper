require 'spec_helper'

describe CheckPhoto do
  let(:photo) {FactoryGirl.create(:flickr_photo) }

  context ".perform" do
    it "posts the image to the node server for processing" do
      connection = double
      connection.should_receive(:get)
      CheckPhoto.perform(photo.to_json, connection)
    end
  end
end
