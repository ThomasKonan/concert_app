Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/searches" => "searches#search", :as => "search_page"
    get "/searches" => "searches#index"
    post "/searches" => "searches#create"
    get "/searches/:id" => "searches#show"
    patch "/searches/:id" => "searches#update"
    delete "/searches/:id" => "searches#destroy"
    post "/sessions" => "sessions#create"
    get "/users" => "users#show"
    post "/users" => "users#create"
  end
end
