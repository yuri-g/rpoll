# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :option do
   name 'option_name'
  end

  factory :poll do
    name 'PollName'
    description 'Description'
    options {|o| [o.association(:option)]}
  end

end
