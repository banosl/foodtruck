Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :food_trucks, only: [:index, :show, :create, :update]
    end
  end
end
