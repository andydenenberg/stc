Stc::Application.routes.draw do
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
  
  get 'home/start' => 'home#start', :as => :start
  get 'home/groundbreaking' => 'home#groundbreaking', :as => :groundbreaking

end