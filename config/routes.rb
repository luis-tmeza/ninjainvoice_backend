Rails.application.routes.draw do
  resources :products do
    get :search, to: 'products#search', on: :collection
  end
  resources :customers do
    get :search, to: 'customers#search', on: :collection
  end
  resources :vendors, only: [:index, :show, :create, :update, :destroy]
  resources :invoice_details, only: [:index, :show, :create, :update, :destroy]
  resources :invoices, only: [:index, :show, :create, :update, :destroy]
  resources :contacts, only: [:index, :show, :create, :update, :destroy]

end
