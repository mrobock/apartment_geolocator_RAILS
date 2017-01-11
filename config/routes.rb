Rails.application.routes.draw do
  devise_for :owners
  get 'apartments/all_map_locations'
  resources :apartments do
    get 'map_location'
    get 'search', on: :collection
  end



  root 'apartments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
