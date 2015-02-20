require 'resque/server'

Rails.application.routes.draw do

  root :to => 'site#index'

  namespace :admin do |admin|

    mount Resque::Server.new, at: "/resque"

    devise_for :users, :controllers => {
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

    get 'jobs', :to => "jobs#index"

    root :to => "articles#index"
  end

end
