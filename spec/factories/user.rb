# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'test_name' }
    email { 'example@email.com' }
    mobile_number { '1234567890' }
  end
end
