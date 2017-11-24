Rails.application.routes.draw do
  namespace :oauth do
    resources :users
  end
  devise_for :users
  devise_scope :user do
    get 'session/choose', to: 'users/sessions#choose'
    root to: "devise/sessions#new"
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
