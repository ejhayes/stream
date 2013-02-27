Stream::Application.routes.draw do
  
  root :to => 'pages#login'

  post '/login' => 'pages#handle_login'

  get '/me' => 'dashboard#dashboard'
end
