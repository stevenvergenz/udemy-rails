Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #get 'posts', to: 'posts#index'
  #get 'show', to: 'posts#show'
  resources :posts

  # set an index page (not a redirect)
  root to: "posts#index"

end
