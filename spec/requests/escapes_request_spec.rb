require 'spec_helper'

describe "Visiting the escapes index" do
  let!(:escapes) { [] }
  before do
    5.times do
      escapes << FactoryGirl.create(:escape)
    end
  end

  context "When I visit the site root" do

    before(:each) { visit root_path }

    it "shows me a list of current escapes" do
      within("#escapes") do
        escapes.each do |e|
          puts e.inspect
          page.should have_content(e.title)
        end
      end
    end
  end
end
