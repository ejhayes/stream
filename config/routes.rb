Stream::Application.routes.draw do
  root :to => 'dashboard#dashboard', :constraints => lambda { |req| !req.session[:user_id].nil? }
  root :to => 'pages#login', :constraints => lambda { |req| req.session[:user_id].nil? }

  post '/login' => 'pages#handle_login'

  get '/logout' => 'pages#logout'
end
