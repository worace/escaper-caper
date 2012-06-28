require 'spec_helper'

describe Escape do
  context("#primary_category") do
    let!(:escape) { FactoryGirl.create(:culture_escape) }
    let(:art_galleries) { FactoryGirl.create(:art_galleries) }
    let(:gallery) { FactoryGirl.create(:gallery, escape_id: escape.id) }


    before do
      gallery.categories << art_galleries
    end

    it "returns the primary category for the escape based on its attractions" do
      escape.primary_category.should == art_galleries
    end
  end
end
