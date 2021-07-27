Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :letters
  resources :polls
  resources :sitemaps
  
  get '/error_test' => 'letters#error_test'
end
