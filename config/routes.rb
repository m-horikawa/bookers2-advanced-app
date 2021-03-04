Rails.application.routes.draw do
  get 'search/search'
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update, :following, :followers ]
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  get '/search' => 'search#search'
  resources :users do
    member do
    get :following, :followers
  end
  end
  
  post 'follow/:id' => 'relationships#create', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow' # フォロー外す
  
end
