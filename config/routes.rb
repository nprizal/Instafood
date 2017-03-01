Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }

  resources :posts, except: [:show] do
    resources :comments
  end

  root to: 'posts#index'
end
