require 'spec_helper'

describe "Given I am wanting to browse some escapes" do
  let!(:escapes) { [] }
  before do
    5.times do
      escapes << FactoryGirl.create(:escape)
    end
  end

  context "When I visit the escapes index" do

    before(:each) { visit escapes_path }

    it "shows me a list of current escapes" do
      within("#escapes") do
        escapes.each do |e|
          page.should have_content(e.title)
        end
      end
    end

    it "gives me a link to get more details on the escape" do
      within("#escapes") do
        escapes.each do |e|
          within("#escape_#{e.id}") do
            click_link_or_button(e.title)
          end
        end
      end
    end
  end

  context "When I visit an individual escape page" do
    let!(:escape) { FactoryGirl.create(:escape) }
    let!(:photo)  { FactoryGirl.create(:flickr_photo, :escape_id => escape.id) }
    let!(:venue)  { FactoryGirl.create(:foursquare_spot, :escape_id => escape.id) }

    before(:each) do
      visit escape_path(escape)
    end

    it "displays the Flickr images attached to this escape" do
      within ("#flickr-carousel") do
        page.should have_image photo.url_med
      end
    end

    it "displays foursquare venues for the escape" do
      within("#attraction_#{venue.id}") do
        page.should have_content venue.name
      end
    end

    it "displays foursquare checkins for each venue" do
      within("#attraction_#{venue.id}") do
        page.should have_content venue.checkins
      end
    end
  end
end
