Rails.application.routes.draw do
  root to: 'artists#index'


  resources :artists do
    resources :songs
    get '/delete_all_songs', to: 'artists#delete_all_songs', as: 'delete_all_songs'
  end

end
