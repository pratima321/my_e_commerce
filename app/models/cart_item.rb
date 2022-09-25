# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :cart

  def create_cart_item(add_addon)
    @add_addon = add_addon
    base_price = calculate_base_price
    self.total_price = base_price
    save!
  end

  def update_cart_item(cart_item_params)
    @add_addon = cart_item_params[:add_addon]

    raise "Can not add addons more than #{addon.max}" if @add_addon && addon && addon_quantity.to_i == addon.max

    if @add_addon && addon
      addon_quantity.to_i += 1
    else
      self.quantity += 1
    end

    self.base_price = calculate_base_price
    self.total_price = quantity * base_price
    save!
  end

  def delete_cart_item(cart_item_params)
    @remove_addon = cart_item_params[:remove_addon]

    if @remove_addon == 'true'
      addon_quantity.to_i -= 1
      self.base_price = calculate_base_price
      self.total_price = quantity * base_price
      save!
    elsif self.quantity > 1
      self.quantity = quantity - 1
      self.total_price = quantity * base_price
      save!
    else
      destroy!
    end
  end

  private

  def variation
    return unless variation_id

    @variation ||= Variation.find_by_id!(variation_id)
  end

  def item
    return unless item_id

    @item ||= Item.find_by_id!(item_id)
  end

  def addon
    return unless addon_id

    @addon ||= Addon.find_by_id!(addon_id)
  end

  def calculate_base_price
    if @add_addon && addon
      addon.display_price + (variation ? variation.display_price : item.item_price)
    elsif @remove_addon && addon
      addon.display_price - (variation ? variation.display_price : item.item_price)
    else
      variation ? variation.display_price : item.item_price
    end
  end
end
