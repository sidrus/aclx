Rails.application.routes.draw do
  resources :users do
    collection do 
      post :import
      get :import_show
      delete :destroy_all
    end
  end

  get '/print/:id', :to => 'users#print', :as => 'print'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: "users#index"
end