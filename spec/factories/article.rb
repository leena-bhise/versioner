FactoryGirl.define do
  factory :article, :class => 'Article' do
    title "Test Article title"
    body "Test Article body"
    user_id 1
    organisation_id 1
  end
  
  factory :article_for_organisation, :class => 'Article' do
    title "Test Article title for organization"
    body "Test Article body for organization"
    user_id 1
  end
end
