Rails.application.routes.draw do
  root 'welcome#index'

  get 'learning', to: 'terms#learning'
  post 'toggle_term_learning', to: 'terms#toggle_learning'

  resources :terms, except: [:new]
  resources :categories, except: [:new]
end
