Rails.application.routes.draw do

resources :tweets do
  resources :likes, only: [:create, :destroy]
  member do
    post 'retweet'
  end 
end

devise_for :users, controllers: {
  sessions: 'users/sessions'
}
  root 'tweets#index'
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

