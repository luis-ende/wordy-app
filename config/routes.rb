Rails.application.routes.draw do
  root 'welcome#index'

  resources :terms, except: [:new]
  resources :categories, except: [:new]
end
