Rails.application.routes.draw do
  devise_for :admins
  resources :admins
  resources :users do
    resources :vehicles
    
    collection do 
      post :import
      get :import_show

      get :import_google
      post :import_google

      delete :destroy_all
    end
  end

  get '/print/:id', :to => 'users#print', :as => 'print'
  get '/leadership', :to => 'users#leadership'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: "users#index"
end