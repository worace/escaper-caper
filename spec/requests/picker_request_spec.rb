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

    it "shows me a list of the parent categories for the escapes" do
      within("#parent-categories") do
        parents.each do |p|
          page.should have_selector("#category-#{p.id}")
          page.should have_selector("#category-#{p.id}-name")
          page.should have_content(p.name)
        end
      end
    end

    context "and I select a category" do
      let(:random_parent) { ParentCategory.offset(rand(ParentCategory.count)) }
      let(:food_parent) { ParentCategory.find_by_name("Food") }

      it "takes me to an escape for the category I select" do
        click_link_or_button("category-#{food_parent.id}-link")
        current_path.should == escape_path(food_escape)
      end
    end
  end
end
