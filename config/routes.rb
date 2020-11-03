Rails.application.routes.draw do
  devise_for :users
  root to: "moyattos#index"
  resources :moyattos, only:[:new,:create,:show,:edit,:update,:destroy] do
    resources :guesses, only:[:new,:create,:edit,:update,:destroy]
  end



end
