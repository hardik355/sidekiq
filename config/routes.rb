Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  get 'articles/new'
  get '/articles/:id/show', to: 'articles#show', as: 'article'
  post '/articles', to: 'articles#create'
  root to: 'articles#new'
    
end
