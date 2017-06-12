FactoryGirl.define do
  factory :side_project do
    street { Faker::3526 HIGH ST.word }
    created_by { Faker::Number.number(10) }
  end
end