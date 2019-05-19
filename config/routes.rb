Rails.application.routes.draw do
  get 'people/index'
  devise_for :users
  root "pages#index"
  resources :people
  resources :messages
  get '/people/follow/:id', to: "people#follow", as: :follow
  get '/people/unfollow/:id', to: "people#unfollow", as: :unfollow

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
