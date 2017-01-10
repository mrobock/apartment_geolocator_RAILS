Rails.application.routes.draw do
  get 'apartments/all_map_locations'
  resources :apartments do
    get 'map_location'
  end



  root 'apartments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
