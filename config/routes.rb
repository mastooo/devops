Devops::Application.routes.draw do

  root :to => "home#show", :as => :home

  get "/dashboard", :controller => "dashboard", :action => "show", :as => :dashboard
  get '/logout' => "sessions#destroy", :as => :logout
  get '/auth/:provider/callback', to: 'sessions#create'
end
