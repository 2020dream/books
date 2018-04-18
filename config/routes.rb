Rails.application.routes.draw do

  root 'books#index'

  get '/auth/:provider/callback', to: 'sessions#create', as: 'auth_callback'
  get '/auth/github', as: 'github_login'

  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/login', to: 'sessions#destroy', as: 'logout'

  # patch '/authors/:id/mark_pulitzer', to: 'authors#mark_p'

  resources :authors do
    resources :books, only: [:new, :create]
  end

  resources :books, except: [:new, :create]


  # GET  /books/new

  # root_path exists

  # # patch '/books/pinecone/:bannana', to: 'books#read'
  # get '/books/new', to: 'books#new', as: 'new_book'
  # # get 'books/search/'
  # get '/books/:id', to: 'books#show', as: 'book'
  # get '/books', to: 'books#index', as: 'books'
  # post '/books', to: 'books#create'
  # get '/books/:id/edit', to: 'books#edit', as: 'edit_book'
  # patch '/books/:id', to: 'books#update'
  # delete '/books/:id', to: 'books#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
