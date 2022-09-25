# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { 'test item' }
    description { 'dummy description' }
    item_price { '100' }
    is_item_available { 'true' }

    # association :variation
    # association :addon
    # association :category
  end
end
