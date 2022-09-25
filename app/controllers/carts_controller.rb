# frozen_string_literal: true

class CartsController < ApplicationController

  def index
    @user_id = params.require(:user_id)

    cart_details = user.cart
    cart_items = cart_details.cart_items

    render json: { cart_details: cart_details, cart_items: cart_items, final_amount_to_be_paid: cart_details.gross_amount }
  end

  private

  def user
    @user ||= User.find_by_id(@user_id)
  end
end
