Rails.application.routes.draw do
  resources :users, defaults: {format: :json}, only: [:create, :show, :destroy]  do
    post 'sign_in', on: :collection
    resources :closets, only: [:index, :create]
    resources :articles, only: [:index]
  end

  resources :closets, only: [:show, :destroy] do
    resources :articles, only: [:index]
  end
  resources :articles, only: [ :create, :update,:destroy]
  get 'amazon/sign_key'
end
