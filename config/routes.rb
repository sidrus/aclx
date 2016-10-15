Rails.application.routes.draw do
  resources :users do
    collection { post :import }    
  end

  get '/print/:id', :to => 'users#print', :as => 'print'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end