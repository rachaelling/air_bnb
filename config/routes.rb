Rails.application.routes.draw do
  get 'braintree/new'
  post 'braintree/checkout'
  root 'welcome#index'

#*** rails g clearance:routes show all these default Clearance routes
resources :passwords, controller: "clearance/passwords", only: [:create, :new]
resource :session, controller: "clearance/sessions", only: [:create]
resources :users, controller: "clearance/users", only: [:create] do
  resource :password,
    controller: "clearance/passwords",
    only: [:create, :edit, :update]

  end

get "/sign_in" => "clearance/sessions#new", as: "sign_in"
delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
get "/sign_up" => "clearance/users#new", as: "sign_up"
#*** end of default routes of Clearance

resources :users, controller: "users", only: [:show, :edit, :update, :index]
resources :listings do
  resources :reservations, only: [:create, :show]
end

resources :reservations, only: [:show, :destroy]

#Route that redirects the user from Facebook(the provider) to the app
get "/auth/:provider/callback" => "sessions#create_from_omniauth"


end
