Bloccit::Application.routes.draw do

  devise_for :users

  #nested routes
  resources :topics do
    resources :posts, except: [:index]
  end
  

  get 'about' => 'welcome#about'
  
  root to: "welcome#index"
end
