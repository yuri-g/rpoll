# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :option do
   name 'option1'
  end

  factory :poll do
    name 'PollName'
    description 'Description'
    multiple_options true
    options {|o| [o.association(:option), o.association(:option, name: 'option2')]}
  end

end
