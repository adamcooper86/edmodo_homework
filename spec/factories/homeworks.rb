FactoryGirl.define do
  factory :homework do
    title "MyString"
    question "MyString"
    due Date.today + 1
  end
end
