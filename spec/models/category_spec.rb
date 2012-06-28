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

  it "sets its parent_category after creation" do
    category = FactoryGirl.create(:category)
    category.parent_category.name.should == "Arts & Entertainment"
  end

  it "won't set anything for a nil parent" do
    category = FactoryGirl.create(:category, parent: nil)
    category.parent_category.should be_nil
  end
end
