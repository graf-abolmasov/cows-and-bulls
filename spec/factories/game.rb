FactoryGirl.define do

  factory :game do
    level 5
    random_number 12345
  end

  trait :won do
    result :won
  end

end