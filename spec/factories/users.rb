FactoryGirl.define do
  factory :user do
    factory :teacher do
      sequence(:username){|n| "teacher#{n}"}
      role 'teacher'
    end
    factory :student do
      sequence(:username){|n| "student#{n}"}
      role 'student'
    end
  end
end
