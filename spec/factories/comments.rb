FactoryGirl.define do
  factory :comment do
    body "Some body"
    author_id 1
    abuse_count 0
    article
  end
end
