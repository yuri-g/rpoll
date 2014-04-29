Rpoll::Application.routes.draw do
  devise_for :users

  root 'polls#index'

  resources :polls
  resources :votes
end
