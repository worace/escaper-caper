# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    name "Some Category"
    plural_name "Some Categories"
    short_name "Some Category"
    foursquare_id "4bf58dd8d48988d1e2931735"
    primary true
    parent "Arts & Entertainment"
    icon_url "https://foursquare.com/img/categories/arts_entertainment/artgallery.png"
  end

  factory :art_gallery, class: Category do
    name "Art Gallery"
    plural_name "Art Galleries"
    short_name "Art Gallery"
    foursquare_id "4bf58dd8d48988d1e2931735"
    primary true
    parent "Arts & Entertainment"
    icon_url "https://foursquare.com/img/categories/arts_entertainment/artgallery.png"
  end

  factory :cocktail_bar, class: Category do
    name "Cocktail Bar"
    plural_name "Cocktail Bars"
    short_name "Cocktail"
    foursquare_id "4bf58dd8d48988d11e941735"
    primary false
    parent "Nightlife Spots"
    icon_url "https://foursquare.com/img/categories/nightlife/cocktails.png"
  end

  factory :restaurant, class: Category do
    name "Restaurant"
    plural_name "Restaurants"
    short_name "Other - Food"
    foursquare_id "4bf58dd8d48988d1e2931735"
    primary true
    parent "Food"
    icon_url "https://foursquare.com/img/categories/food/default.png"
  end
end
