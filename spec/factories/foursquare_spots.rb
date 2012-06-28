# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :foursquare_spot do
    escape_id 1
    foursquare_id "4b05867af964a520856322e3"
    name "Some Venue"
    latitude "41.307837"
    longitude "-72.930478"
    checkins 506
    url "http://example.com"
    tips 2
  end

  factory :gallery, class: FoursquareSpot do
    escape_id 1
    foursquare_id "4b05867af964a520856322e3"
    name "Yale Center for British Art"
    latitude "41.307837"
    longitude "-72.930478"
    checkins 506
    url "http://britishart.yale.edu/"
    tips 2
  end

  factory :restaurant, class: FoursquareSpot do
    escape_id 1
    foursquare_id "4bc42961dce4eee172fb719d"
    name "The Blackthorne Inn and Restaurant"
    latitude "39.00098741054535"
    longitude "-77.92260326"
    checkins 506
    url ""
    tips 2
  end

  factory :nightclub, class: FoursquareSpot do
    escape_id 1
    foursquare_id "4ed9330bf790c045443b7008"
    name "Inercia Classic"
    latitude "41.387378754087585"
    longitude "2.1833516863022067"
    checkins 506
    url ""
    tips 2
  end
end
