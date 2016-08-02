FactoryGirl.define do 
  factory :vote do
    user
    post
    value { RandomData.random_vote }
  end
end