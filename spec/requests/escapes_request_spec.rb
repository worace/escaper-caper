require 'spec_helper'

describe "Given I am wanting to browse some escapes" do
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
    let(:escape) { FactoryGirl.create(:escape) }
    before(:each) do
      visit escape_path(escape)
    end

    it "shows the stuff" do
      pending
    end
  end
end
