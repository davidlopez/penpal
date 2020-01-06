Rails.application.routes.draw do
  root 'welcome#index'

  get '/landing', to: 'landing#index'
  get '/survey', to: 'survey#index'
  get '/survey/feelings', to: 'feeling_preferences#new'
  get '/survey/time', to: 'time_preferences#new'
  get '/survey/activities', to: 'activity_preferences#new'
  get '/survey/media', to: 'media_preferences#new'
  get '/survey/music', to: 'music_preferences#new'

  get '/preferences/feelings/:id/edit', to: 'feeling_preferences#edit'
  get '/preferences/time/:id/edit', to: 'time_preferences#edit'
  get '/preferences/activities/:id/edit', to: 'activity_preferences#edit'
  get '/preferences/media/:id/edit', to: 'media_preferences#edit'
  get '/preferences/music/:id/edit', to: 'music_preferences#edit'

  patch '/preferences/feelings/:id', to: 'feeling_preferences#update'
  patch '/preferences/time/:id', to: 'time_preferences#update'
  patch '/preferences/activities/:id', to: 'activity_preferences#update'
  patch '/preferences/media/:id', to: 'media_preferences#update'
  patch '/preferences/music/:id', to: 'music_preferences#update'



  get '/boost', to: 'boost#show'
  post '/journal_entries', to: 'journal_entries#create'

  get '/profile', to: 'users#show'
  post '/survey', to: 'survey#create'

  resources :buddies, except: :show
  resources :users, only: [:edit, :update, :destroy]

  get '/preferences', to: 'users/preferences#index'
  get '/preferences/edit', to: 'users/preferences#edit'
  patch '/preferences', to: 'users/preferences#update'

  get '/dbt', to: 'dbt#show'
  post '/feedback', to: 'feedback#create'

  delete '/logout', to: 'sessions#destroy'
  get '/auth/google_oauth2', as: 'google_login'
  get '/auth/google_oauth2/callback', to: 'users#create'

  get '/auth/spotify', as: 'spotify'
  get '/auth/spotify/callback', to: 'spotify#create'
end
