Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    get "/events" => "events#index"
    get "/user_events" => "user_events#index"
    post "/user_events" => "user_events#create"
    get "/user_events/:id" => "user_events#show"
    patch "/user_events/:id" => "user_events#update"
    delete "/user_events/:id" => "user_events#destroy"

    get "/setlists" => "setlists#index"

    # get "https://api.setlist.fm/rest/1.0/search/artists?artistName=" => "events#setlist"
  end
end
