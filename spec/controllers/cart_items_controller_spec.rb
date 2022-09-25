# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartItemsController do
  describe '#create' do
    let!(:user) { create :user }
    let!(:category) { create :category }
    let!(:item) { create :item, category: category }
    let!(:variation) { create :variation, item: item }

    context 'when all parameters are present' do
      let(:params) do
        {
          user_id: user.id,
          variation_id: variation.id,
          add_addon: false
        }
      end

      it 'adds item to cart' do
        post :add_item_to_cart, params: params

        expect(response.status).to eq 200
        expect(CartItem.count).to eq 1
        expect(Cart.count).to eq 1
      end
    end

    context 'when user adds same item with same combinations' do
      let!(:cart) { create :cart, user: user }
      let!(:cart_item) do
        create :cart_item, item_id: item.id, variation_id: variation.id, quantity: 1, base_price: 100, cart: cart
      end

      let(:params) do
        {
          user_id: user.id,
          variation_id: variation.id,
          add_addon: false
        }
      end

      it 'updates quantity of the cart item' do
        post :add_item_to_cart, params: params

        crt_itm = CartItem.find(cart_item.id)

        expect(response.status).to eq 200
        expect(crt_itm.quantity).to eq 2
        expect(crt_itm.base_price).to eq 100
        expect(crt_itm.total_price).to eq 200
        expect(CartItem.count).to eq 1
      end
    end

    context 'when user adds different item' do
      let!(:cart) { create :cart, user: user }
      let!(:cart_item) do
        create :cart_item, item_id: item.id, variation_id: variation.id, quantity: 1, base_price: 100, cart: cart
      end
      let!(:variation2) { create :variation, item: item }

      let(:params) do
        {
          user_id: user.id,
          variation_id: variation2.id,
          add_addon: false
        }
      end

      it 'creates new cart item' do
        post :add_item_to_cart, params: params

        expect(CartItem.count).to eq 2
        expect(user.cart.reload.gross_amount).to eq(user.cart.cart_items.map(&:total_price).compact.sum)
      end
    end
  end
end
