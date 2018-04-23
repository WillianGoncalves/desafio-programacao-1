Rails.application.routes.draw do
  root 'sales#new'
  resources :sales, only: [:index, :new, :create]
end
