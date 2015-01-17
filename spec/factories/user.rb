FactoryGirl.define do
  factory :user do
    name "test1"
    email "test@mailinator.com"
    password "12345678"
    password_confirmation "12345678"
  end
end
