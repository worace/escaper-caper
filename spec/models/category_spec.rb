require 'spec_helper'

describe Category do
  let(:cat) { FactoryGirl.create(:category) }
  let(:venue) {FactoryGirl.create(:foursquare_spot) }

  it "avoids adding duplicate categories for a venue" do
    venue.categories << cat
    venue.categories.count.should == 1
    venue.categories.should include(cat)

    expect {venue.categories << cat }.to raise_error
    venue.categories.count.should == 1
    venue.venue_categories.count.should == 1
  end
end
