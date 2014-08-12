FactoryGirl.define do
  factory :move do
    association :game
    number 12345
  end
end