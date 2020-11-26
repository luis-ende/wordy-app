Rails.application.routes.draw do
  get 'sessions/new'
  root 'welcome#index'

  get 'learning', to: 'terms#learning'
  get 'explore', to: 'terms#explore'
  get 'search', to: 'terms#search'
  get 'search_tag', to: 'tags#search'
  post 'toggle_term_learning', to: 'terms#toggle_learning'
  patch 'update_term_tags', to: 'terms#update_tags'

  resources :users
  resource :session, only: %i[new create destroy]
  resources :terms, except: [:new]
  resources :categories, except: [:new]
  resources :examples, except: [:new]
end
