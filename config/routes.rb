Rails.application.routes.draw do
  get 'home/top'
  get 'home/about'
  devise_for :users
  root 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :books
 resources :users
end
