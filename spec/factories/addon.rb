# frozen_string_literal: true

FactoryBot.define do
  factory :addon do
    name { 'test addon' }
    description { 'dummy addon description' }
    display_price { '100' }

    association :item
  end
end
