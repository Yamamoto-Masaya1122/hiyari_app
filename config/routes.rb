Rails.application.routes.draw do
  root 'static_pages#top'
  resources :users, only: [:index, :new, :create]
  resources :posts
end
