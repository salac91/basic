FactoryGirl.define do
  factory :comment do
    body "Some body"
    abuse_count 0
    user
    article
  end
end
