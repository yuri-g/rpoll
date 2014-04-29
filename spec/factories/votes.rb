# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    user_id 1
    option_id 1
    poll_id 1
  end
end
