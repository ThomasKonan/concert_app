Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/events" => "events#index"
    get "/events" => "events#setlist"
    post "/sessions" => "sessions#create"
    get "/users" => "users#show"
    post "/users" => "users#create"
  end
end
