Rails.application.routes.draw do
    root "sessions#new"

    post "/sessions/create" => "sessions#create"
    delete "/sessions/:id" => "sessions#destroy"


    post "/users/create" => "users#create"
    get "/users/:id/edit" => "users#edit"
    patch "/users/:id/edit" => "users#update"

    get "/events" => "events#index"
    post "/events/create" => "events#create"
    get "/events/:id" => "events#view"
    delete "/events/:id/destroy" => "events#destroy"

    post "/participations/:id/create" => "participations#create"
    delete "/participations/:id/destroy" => "participations#destroy"

    post "/events/:id/comment/create" => "comments#create"

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
