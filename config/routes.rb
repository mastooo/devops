Devops::Application.routes.draw do


  get '/login', :to => 'sessions#new', :as => :login
  get '/auth/:provider/callback', to: 'sessions#create'
end
