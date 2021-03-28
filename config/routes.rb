Rails.application.routes.draw do
  resources :sales_coffees
  root "sales_coffees#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
