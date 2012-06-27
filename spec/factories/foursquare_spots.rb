# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :foursquare_spot do
    escape_id 1
    foursquare_id "4b05867af964a520856322e3"
    name "Yale Center for British Art"
    latitude "41.307837"
    longitude "-72.930478"
    checkins 506
    url "http://britishart.yale.edu/"
    tips 2
  end
end
