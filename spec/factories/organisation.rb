FactoryGirl.define do
  factory :organisation, :class => 'Organisation' do
    name "Test Org Name"
    description "Test Org Description"
  end
  
  factory :organisation_with_article, :class => 'Organisation' do
    name "Org with article"
    description "Org with article Description"
    after(:create) do |organisation|
      create(:article_for_organisation, organisation: organisation)
    end
  end  
end
