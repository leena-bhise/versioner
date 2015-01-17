FactoryGirl.define do
  factory :article, :class => 'Article' do
    title "Test Article title"
    body "Test Article body"
    user_id 1
    organisation_id 1
  end
end
