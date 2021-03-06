require 'resque/server'

Rails.application.routes.draw do

  root :to => 'site#index'

  resources :comments
  resources :articles, only: [:index, :show]
  
  resources :galleries
  resources :gallery_images, only: :show
  get 'images', to: 'galleries#index'
  
  resources :pages
  get '/page/:name_slug', to: 'pages#show'
  
  get '/projects', { controller: 'pages', action: 'show', name_slug: 'projects' }
  get '/resume', { controller: 'pages', action: 'show', name_slug: 'resume' }
  
  namespace :site do
    get 'tweets'
  end

  namespace :admin do |admin|

    mount Resque::Server.new, at: "/resque"

    devise_for :users, controllers: {
      registrations: 'admin/users/registrations',
      sessions: 'admin/users/sessions',
      passwords: 'admin/users/passwords'
    }

    resources :articles
    resources :categories
    resources :contents
    resources :users
    resources :galleries
    resources :gallery_images

    get 'jobs', to: "jobs#index"

    root to: "articles#index"
  end

end
