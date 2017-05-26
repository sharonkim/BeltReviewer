Rails.application.routes.draw do
    root "sessions#index"

### Sessions ###
    get "sessions/index"
    post "sessions/create" => "sessions#create"
    post "login" => "sessions#create"
    delete "logout" => "sessions#destroy"

### Users ###
    get "users" => "users#index"
    post "users/create" => "users#create"
    get "users/( :id )/edit" => "users#edit", as: "users_edit"
    patch "users/( :id )/update" => "users#update", as: "users_update"
    delete "users/( :id )" => "s#destroy"

### Events ###
    get "events" => "events#index", as: "events_index"
    post "events/create" => "events#create"
    get "events/( :id )/show" => "events#show", as: "events_show"
    patch "events/( :id )/update" => "events#update"
    delete "events/( :id )" => "events#destroy"

### Participants ###
    post "events/( :event_id )/participants/create" => "participants#create"
    delete "participants/( :id )/destroy" => "participants#destroy"

### Comments ###
    post "events/( :event_id )/comments/create" => "comments#create"

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
