# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { 'test category' }
    description { 'dummy category description' }
  end
end
