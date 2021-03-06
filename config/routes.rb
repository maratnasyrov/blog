Rails.application.routes.draw do
  devise_for :users

  root to: "articles#index"

  resources :articles do
    resources :comments
  end

  resources :users, only: [:show, :index]

  get 'my', to: 'articles#my_articles'
  get 'private', to: 'articles#my_private_posts'
end
