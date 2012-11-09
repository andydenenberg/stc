Stc::Application.routes.draw do
  resources :comments do
    member do
      get 'modify'
    end
  end

  resources :posts do
    collection do
      get 'add_comment'
    end
  end
  

  authenticated :user do
#    root :to => 'home#index'
    root :to => 'home#start'
  end
  root :to => "home#welcome"
  devise_for :users
  resources :users
  
  get 'home/welcome' => 'home#welcome', :as => :welcome
  get 'home/index' => 'home#index', :as => :index
  get 'home/news' => 'home#news', :as => :news
  get 'home/events' => 'home#events', :as => :events
  get 'home/donate' => 'home#donate', :as => :donate
  get 'home/reference' => 'home#reference', :as => :reference
  
  get 'home/start' => 'home#start', :as => :start
  get 'home/groundbreaking' => 'home#groundbreaking', :as => :groundbreaking

end