# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email    { Faker::Internet.email }
    password { '123123' }
    password_confirmation { '123123' }
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
  end
end
