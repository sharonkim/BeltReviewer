Rails.application.routes.draw do
    root 'sessions#new'
    get 'sessions/new'
    post 'sessions' => 'sessions#create'
    delete 'sessions/:id' => 'sessions#destroy'

    get 'users/new'
    get 'users/:id' => 'users#show', as: 'users_show'
    get 'users/:id/edit' => 'users#edit', as: 'users_edit'
    post 'users' => 'users#create'
    post 'users/login' => 'users#login'
    patch 'users/:id' => 'users#update'
    delete 'users/:id' => 'users#logout'

    get 'events' => 'events#index'
    get 'events/:id/edit' => 'events#edit'
    get 'events/:id/join' => 'events#join'
    get 'events/:id/cancel' => 'events#cancel'
    post 'events' => 'events#create'
    post 'events/:id/comments' => 'events#comment'
    patch 'events/:id' => 'events#update'
    delete 'events/:id' => 'events#destroy'

    resources :sessions, only: [:new, :create, :destroy]
    resources :users
    resources :comments, only: [:create, :destroy]

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
