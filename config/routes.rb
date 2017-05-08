Rails.application.routes.draw do
    root "sessions#index"

    get "sessions/index"
    post "sessions/create" => "sessions#create"
    post "login" => "sessions#create"
    delete "logout" => "sessions#destroy"

    get "users" => "users#index"
    post "users/create" => "users#create"
    get "users/new" => "users#new"
    patch "users/:id/update" => "users#update", as: "users_update"
    delete "users/:id" => "users#destroy"

    get "events" => "events#index", as: "events_index"
    get "events/new" => "events#new"
    post "events/create" => "events#create"
    get "events/:id/show" => "events#show", as: "events_show"
    patch "events/:id/update" => "events#update"
    delete "events/:id" => "events#destroy"

    post "events/( :event_id )/participants/create" => "participants#create"
    delete "participants/:id/destroy" => "participants#destroy"

    post "event/( :event_id )/comments/create" => "comments#create"

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
