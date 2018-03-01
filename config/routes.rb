Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'session/choose', to: 'users/sessions#choose'
    root to: "users/sessions#choose"
  end

  use_doorkeeper do
    controllers authorizations: 'doorkeeper/authorizations'
  end

  namespace :api do
    namespace :v1 do
      # another api routes
      get '/me' => 'credentials#me', defaults: { format: :json }
    end
  end
end
