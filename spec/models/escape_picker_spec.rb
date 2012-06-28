require 'spec_helper'

describe EscapePicker do
  let!(:escapes) { [] }
  let!(:categories) { [] }

  let!(:escape) { FactoryGirl.create(:culture_escape) }

  let(:bars) { FactoryGirl.create(:cocktail_bars) }
  let(:restaurants) { FactoryGirl.create(:restaurants) }
  let(:art_galleries) { FactoryGirl.create(:art_galleries) }

  let(:gallery) { FactoryGirl.create(:gallery, escape_id: escape.id) }

  let(:picker) { EscapePicker.new }

  context("#escape_for") do
    before do
      gallery.categories << art_galleries
    end
    it "returns an escape whose primary category is the parent cat supplied" do
      parent = art_galleries.parent_category
      picker.escape_for(parent).should == escape
    end

    it "returns a random escape if there are none for the category supplied" do
      picker.escape_for(restaurants.parent_category).should be_an(Escape)
    end

    it "will function if an escape has a category with nil parent" do
      new_cat = FactoryGirl.create(:category, parent: nil)
      new_cat_with_parent = FactoryGirl.create(:category, parent: "Art")
      new_spot = FactoryGirl.create(:restaurant, escape_id: escape.id)

      new_spot.categories << new_cat
      new_spot.categories << new_cat_with_parent

      picker.escape_for(new_cat_with_parent.parent_category).should == escape

    end
  end
end
