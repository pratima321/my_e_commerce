# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  def update_gross_amount!
    self.gross_amount = cart_items.map(&:total_price).compact.sum
    save!
  end
end
