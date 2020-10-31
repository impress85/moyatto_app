Rails.application.routes.draw do
  devise_for :users
  root to: "moyattoes#index"
  resources :moyattoes, only:[:new,:create]

end
