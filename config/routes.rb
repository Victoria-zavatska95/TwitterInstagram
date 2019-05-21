Rails.application.routes.draw do
  get 'people/index'
  devise_for :users
  root "pages#index"
  resources :messages
  resources :tweets
  resources :mems
  resources :userparams
  get 'news/index'
  get '/people/follow/:id', to: "people#follow", as: :follow
  get '/people/unfollow/:id', to: "people#unfollow", as: :unfollow
  get '/people/my_followers', to: "people#my_followers", as: :my_followers
  get '/people/my_following', to: "people#my_following", as: :my_following
  get '/messages/write_message_new/:id', to: "messages#write_message_new", as: :write_message_new
  post '/messages/write_message_create/:id', to: "messages#write_message_create", as: :write_message_create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
