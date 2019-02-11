Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/locations/reset', to: 'locations#reset'
      resources :npcs
      resources :dog_collectables
      resources :locations
    end
  end

end
