Rails.application.routes.draw do
  root 'welcome#index'

  resources :terms
  resources :categories, except: [:new]
end
