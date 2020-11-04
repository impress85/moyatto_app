Rails.application.routes.draw do

  devise_for :users
  root to: "moyattos#index"
  resources :moyattos, only:[:new,:create,:show,:edit,:update,:destroy] do
    resources :advices, only:[:new,:create]
    resources :guesses, only:[:new,:create,:edit,:update,:destroy] do
      resources :sukkiris, only:[:new,:create]
    end  
  end

end
