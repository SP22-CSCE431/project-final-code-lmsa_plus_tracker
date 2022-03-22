Rails.application.routes.draw do
  resources :helps
  resources :announcements
  root to: 'home#index'
  post '/sign_in_event', to: "events#sign_in_event"
  get '/home/adminDash' => "home#adminDash", :as => :admin_root
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: "users/sessions" }
    devise_scope :user do
      get 'users/edit', to: 'users/sessions#edit', as: :edit_user_session
      post 'users/edit', to: 'users/sessions#update'
      get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
      get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
      get 'referrals/admin', :as => :admin_approve
      get 'myhistory/index'
      get 'myhistory/points_leaderboard'
  end

  resources :home
  resources :poin_events
  resources :referrals
  resources :events
  resources :categories
  resources :event_hists
  resources :users
  resources :sessions
  resources :signups #plural???
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
