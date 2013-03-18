# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email do
    sender_id 1
    email_to ""
    email_from ""
    email_subject "MyText"
    email_body "MyText"
  end
end
