Rails.application.routes.draw do
  root "arts#index"
  resources :arts
  resources :artists
  get 'impressions' => "impressions#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
