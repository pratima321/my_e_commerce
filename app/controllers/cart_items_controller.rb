# frozen_string_literal: true

class CartItemsController < ApplicationController
  
  def add_item_to_cart
    @user_id = params.require(:user_id)

    @variation_id = params['variation_id']
    @item_id = params['item_id']
    @addon_id = params['addon_id']

    @cart_item_params = {
      variation_id: @variation_id,
      item_id: @item_id || variation.item_id || addon.item_id,
      addon_id: @addon_id
    }

    cart_item.present? ? cart_item.update_cart_item(@cart_item_params.merge({add_addon: params['add_addon']})) : cart.cart_items.new(@cart_item_params).create_cart_item(params['add_addon'])

    cart.update_gross_amount!

    render json: { success: 'Item has been added to cart successfully' }, status: 200
  rescue => e
    Rails.logger.error('Error adding item to the cart')
    Rails.logger.error("Error: #{e.class} #{e.message} #{e.backtrace.first}")
    render json: { error: 'Uh-oh! Error adding item to the cart, Please try again later.' }
  end

  def remove_item_from_cart
    @user_id = params.require(:user_id)

    @variation_id = params['variation_id']
    @item_id = params['item_id']
    @addon_id = params['addon_id']

    @cart_item_params = {
      variation_id: @variation_id,
      item_id: @item_id || variation.item_id || addon.item_id,
      addon_id: @addon_id
    }

    if cart_item.present?
      cart_item.delete_cart_item(@cart_item_params.merge({remove_addon: params['remove_addon']}))
    else
      render json: { error: 'Cart Item does not exist.' }
      return
    end

    cart.update_gross_amount!

    render json: { success: 'Item removed from the cart.' }
  end

  private

  def user
    @user ||= User.find_by_id!(@user_id)
  end

  def cart
    @cart ||= user.cart || Cart.create!(user: user)
  end

  def variation
    return unless @variation_id

    @variation ||= Variation.find_by_id!(@variation_id)
  end

  def addon
    return unless @addon_id

    @addon ||= Addon.find_by_id!(@addon_id)
  end

  def cart_item
    @cart_item ||= CartItem.find_by(@cart_item_params)
  end
end
