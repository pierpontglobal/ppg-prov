Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users

  get '/user/self', to: 'users#self'

  namespace :apps do
    get '/', to: 'apps#show'
    get '/owned', to: 'apps#my_apps'
    post '/grant/:app_id', to: 'apps#authorize'
    post '/revoke/:app_id', to: 'apps#unauthorize'
  end

  post '/auth/login', to: 'authentication#login'
end
