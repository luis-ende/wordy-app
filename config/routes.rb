Rails.application.routes.draw do
  root 'welcome#index'

  get 'learning', to: 'terms#learning'

  resources :terms, except: [:new]
  resources :categories, except: [:new]
end
