Rails.application.routes.draw do
    root "/" => "sessions#new"

    post "/sessions/create" => "sessions#create"
    delete "/sessions/:id" => "sessions#destroy"


    get "/users/:id/edit" => "users#edit"
    post "/users/create" => "users#create"
    patch "/users/:id/edit" => "users#update"

    get "/events" => "events#index"
    get "/events/:id" => "events#view"
    post "/events/create" => "events#create"
    delete "/events/:id/destroy" => "events#destroy"

    post "/participations/:id/create" => "participations#create"
    delete "/participations/:id/destroy" => "participations#destroy"

    post "/events/:id/comment/create" => "comments#create"

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
