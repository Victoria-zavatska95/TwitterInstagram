Rails.application.routes.draw do
  get 'people/index'
  devise_for :users
  root "pages#index"
  resources :messages
  resources :tweets
  resources :mems
  get '/people/follow/:id', to: "people#follow", as: :follow
  get '/people/unfollow/:id', to: "people#unfollow", as: :unfollow
  get '/people/my_followers', to: "people#my_followers", as: :my_followers
  get '/people/my_following', to: "people#my_following", as: :my_following
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
