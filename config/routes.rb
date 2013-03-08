Stream::Application.routes.draw do
  root :to => 'dashboard#dashboard', :constraints => lambda { |req| !req.session[:user_id].nil? }
  root :to => 'pages#login', :constraints => lambda { |req| req.session[:user_id].nil? }

  post '/login' => 'pages#handle_login'

  get '/logout' => 'pages#logout'

  get '/user/:username' => 'users#show'
  get 'user/:username/follow' => 'users#follow'
  get 'user/:username/unfollow' => 'users#unfollow'


  get '/users' => 'users#list_users'

  post '/stream/tweet' => 'stream#tweet'

  get '/stream/tweets' => 'stream#tweets'
end
