Rails.application.routes.draw do
    root "sessions#new"

    post "sessions/create" => "sessions#create"
    delete "sessions" => "sessions#destroy"

    get "users" => "users#index"
    post "users" => "users#create"
    get "users/:id/edit" => "users#edit"
    patch "users/:id" => "users#update"

    get "events" => "events#index"
    post "events/create" => "events#create"
    get "events/:id" => "events#view"
    patch "events/:id" => "events#update"
    delete "events/:id" => "events#destroy"

    post "participants/:id/create" => "participants#create"
    delete "participants/:id/destroy" => "participants#destroy"

    post "comments/create" => "comments#create"

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
