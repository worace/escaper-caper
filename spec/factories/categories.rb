# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    name "Art Gallery"
    plural_name "Art Galleries"
    short_name "Art Gallery"
    foursquare_id "4bf58dd8d48988d1e2931735"
    primary true
    parent "Arts & Entertainment"
    icon_url "https://foursquare.com/img/categories/arts_entertainment/artgallery.png"
  end
end
