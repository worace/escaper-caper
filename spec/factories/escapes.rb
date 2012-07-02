FactoryGirl.define do
  factory :escape do
    title Faker::Lorem.words(num = 4).join(" ")
    description Faker::Lorem.paragraphs(paragraph_count = 2).join("\n")
    venue Faker::Lorem.words(num = 3).join(" ")
    details Faker::Lorem.paragraph(sentence_count = 2)
    price ("$" + Random.rand(1000).to_s)
    phone Faker::PhoneNumber.phone_number
    street Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state_abbr
    zipcode Faker::Address.zip_code
    expiration "July 04, 2012"
    livingsocial_url "http://www.livingsocial.com/escapes/376890-chesapeake-beach-resort"
    livingsocial_id "376890"
  end

  factory :culture_escape, class: Escape do
    title "Cultured Paris Escape"
    description "Munch on some artes and enrich urself"
    venue "The Louvre"
    details "Art culture gauloises, what could be better"
    price ("$" + Random.rand(1000).to_s)
    phone Faker::PhoneNumber.phone_number
    street Faker::Address.street_address
    city "Paris"
    state "France"
    zipcode Faker::Address.zip_code
    expiration "July 04, 2012"
  end

  factory :food_escape, class: Escape do
    title "Culinary Italian Escape"
    description "Delight your tastebuds with delectable victuals"
    venue "A Shabby Chic Villa"
    details "Truffles and Ravioli all day"
    price ("$" + Random.rand(1000).to_s)
    phone Faker::PhoneNumber.phone_number
    street Faker::Address.street_address
    city "Sienna"
    state "Italy"
    zipcode Faker::Address.zip_code
    expiration "July 04, 2012"
  end

  factory :party_escape, class: Escape do
    title "Miami Nightlife Escape"
    description "Shake that thang all night in los clubs"
    venue "A Chic Modernist Hotel"
    details "Phat beats and tight dresses erry night"
    price ("$" + Random.rand(1000).to_s)
    phone Faker::PhoneNumber.phone_number
    street Faker::Address.street_address
    city "Miami"
    state "FL"
    zipcode Faker::Address.zip_code
    expiration "July 04, 2012"
  end
end
