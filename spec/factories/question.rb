FactoryGirl.define do
  factory :question do
    text Faker::Lorem.sentence
  	tie_breaker nil
  	quiz
  end
end  