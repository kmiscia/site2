Rails.application.routes.draw do

  namespace :admin do |admin|

    devise_for :users, :controllers => {
      registrations: 'admin/users/registrations',
      sessions: 'admin/users/sessions',
      passwords: 'admin/users/passwords'
    }

    resources :articles
    resources :categories

    root :to => "articles#index"
  end

end
