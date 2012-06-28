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
    it "returns an escape whose primary category is the one supplied" do
      picker.escape_for(art_galleries).should == escape
    end
  end
end
