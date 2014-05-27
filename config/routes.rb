Bloccit::Application.routes.draw do


  get "posts/index"
  devise_for :users

  resources :users, only: [:index, :update, :show]

  resources :posts, only: [:index]
  #nested routes
  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts' do
      resources :comments, only: [:create, :destroy]
        resources :favorites, only: [:create, :destroy]
      get '/up-vote' => 'votes#up_vote', as: :up_vote
      get '/down-vote' => 'votes#down_vote', as: :down_vote
    end
  end
  

  get 'about' => 'welcome#about'
  
  root to: "welcome#index"
end
