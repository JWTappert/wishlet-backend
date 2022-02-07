Rails.application.routes.draw do
  resources :wishlists do
    resources :items
  end
end
