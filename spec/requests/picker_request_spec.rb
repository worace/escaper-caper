require 'spec_helper'

describe "Given I am wanting to pick an escape based on my interests" do
  let!(:escapes) { [] }
  let(:category1) { FactoryGirl.create(:category, name: "Arts & Entertainment") }
  let(:category2) { FactoryGirl.create(:category, name: "Food") }
  let(:category3) { FactoryGirl.create(:category, name: "Nightlife") }

  let(:escape1) { FactoryGirl.create(:escape,
                                      title: "Cultured Paris Escape",
                                      city: "Paris",
                                      state: "France") }
  let(:escape2) { FactoryGirl.create(:escape,
                                      title: "Culinary Italian Escape",
                                      city: "Sienna",
                                      state: "Italy") }
  let(:escape3) { FactoryGirl.create(:escape,
                                      title: "Partying Miami Escape",
                                      city: "Miami",
                                      state: "FL") }
  before do
    escapes << escape1
    escapes << escape2
    escapes << escape3
  end

  context "When I visit the homepage" do
    before(:each) { visit root_path }
    it "shows me a dropdown list of categories to select from" do
      within("#escape-categories") do
        page.should have_selector('select')
      end
    end
  end
end
