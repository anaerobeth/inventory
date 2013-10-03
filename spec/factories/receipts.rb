# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :receipt do
    title "MyString"
    description "MyString"
    quantity 1
  end
end
