# frozen_string_literal: true

Rails.application.routes.draw do
  apipie
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cart_items do
    post :add_item_to_cart, on: :collection
    post :remove_item_from_cart, on: :collection
  end

  resources :carts, only: %i[index]
end
