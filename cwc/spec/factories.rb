FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
    zipcode 06511
    gender "default"
    lookingfor "default"
    age 18
  end
end