Rails.application.routes.draw do
  resources :products, only: [:index, :show, :create, :update, :destroy]
  resources :customers, only: [:index, :show, :create, :update, :destroy]
  resources :vendors, only: [:index, :show, :create, :update, :destroy]
  resources :invoice_details, only: [:index, :show, :create, :update, :destroy]
  resources :invoices, only: [:index, :show, :create, :update, :destroy]
  resources :contacts, only: [:index, :show, :create, :update, :destroy]

end
