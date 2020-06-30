Rails.application.routes.draw do
  root 'welcome#index'

  get 'learning', to: 'terms#learning'
  get 'explore', to: 'terms#explore'
  post 'toggle_term_learning', to: 'terms#toggle_learning'

  resources :terms, except: [:new]
  resources :categories, except: [:new]
end
