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
  end
end
