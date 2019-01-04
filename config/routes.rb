Rails.application.routes.draw do
  get 'impressions' => "impressions#index"
  root "arts#index"
  resources :arts
  resources :artists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
