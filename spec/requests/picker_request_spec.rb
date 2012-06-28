require 'spec_helper'

describe "Given I am wanting to pick an escape based on my interests" do
  let!(:escapes) { [] }
  let!(:categories) { [] }
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
    categories << category1
    categories << category2
    categories << category3
  end

  context "When I visit the homepage" do
    before(:each) { visit root_path }
    it "shows me a dropdown list of categories to select from" do
      within("#escape-categories") do
        page.should have_selector('select#category')
      end
    end

    it "includes the categories in the select box" do
      within("select#category") do
        categories.each do |c|
          page.should have_content(c.name)
        end
      end
    end

    it "takes me to an escape for the category I select" do
      page.select("Food", :from => "category")
      click_button "Escape!"
      current_path.should == escape_path(escape2)
    end
  end
end
