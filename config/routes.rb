Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :planets, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create, :new, :update, :edit, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
