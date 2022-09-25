# frozen_string_literal: true

FactoryBot.define do
  factory :variation do
    name { 'test variation' }
    description { 'dummy variation description' }
    item_price { 100 }
    display_price { 100 }

    # association :item
  end
end
