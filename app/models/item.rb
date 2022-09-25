# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :category
  has_many :variations
  has_many :addons
end
