Rails.application.routes.draw do
  devise_for :admins
  resources :admins

  resources :events do
    resources :event_notes
  end
  
  resources :users do
    resources :vehicles
    
    collection do 
      post :import
      get :import_show

      get :import_google
      post :import_google

      delete :destroy_all
    end

    get '/print', :to => 'users#print'
  end

  get '/leadership', :to => 'users#leadership'
  get '/allevents', :to => 'events#allevents'

  root to: "users#index"
end