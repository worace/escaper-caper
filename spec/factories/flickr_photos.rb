# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :flickr_photo do
    escape_id 1
    title "Great flickr photo"
    flickr_id "6371395081"
    url_med "http://farm7.staticflickr.com/6239/6371395081_3d4d35d4be_z.jpg"
  end
end
