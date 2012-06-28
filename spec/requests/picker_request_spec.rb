require 'spec_helper'

describe "Given I am wanting to pick an escape based on my interests" do
  let!(:escapes)       { [] }
  let!(:categories)    { [] }
  let(:art_galleries)  { FactoryGirl.create(:art_galleries) }
  let(:cocktail_bars)  { FactoryGirl.create(:cocktail_bars) }
  let(:restaurants)    { FactoryGirl.create(:restaurants) }

  let(:culture_escape) { FactoryGirl.create(:culture_escape) }
  let(:food_escape)    { FactoryGirl.create(:food_escape) }
  let(:party_escape)   { FactoryGirl.create(:escape) }

  let(:club)           { FactoryGirl.create(:nightclub, escape_id: party_escape.id) }
  let(:gallery)        { FactoryGirl.create(:gallery, escape_id: culture_escape.id) }
  let(:restaurant)     { FactoryGirl.create(:restaurant, escape_id: food_escape.id) }

  let(:gallery_spot)        { FactoryGirl.create(:gallery, escape_id: escape.id) }

  before do
    escapes << culture_escape
    escapes << food_escape
    escapes << party_escape
    categories << cocktail_bars
    categories << restaurants
    categories << art_galleries
    club.categories << cocktail_bars
    gallery.categories << art_galleries
    restaurant.categories << restaurants
  end

  context "When I visit the homepage" do
    let(:parents) {ParentCategory.all}

    before(:each) { visit root_path }

    it "shows me a dropdown list of categories to select from" do
      within("#escape-categories") do
        page.should have_selector('select#category')
      end
    end

    it "includes the categories in the select box" do
      within("select#category") do
        parents.each do |pc|
          page.should have_content(pc.name)
        end
      end
    end

    it "takes me to an escape for the category I select" do
      page.select("Food", :from => "category")
      click_button "Escape!"
      current_path.should == escape_path(food_escape)
    end
  end
end
