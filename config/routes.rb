Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "offices#sign_in"
  post "customer/new/(:id)", to:"customer#new_process", as: :new_process
  get "/sign_up", to: "offices#sign_up", as: :sign_up
  post "/sign_up", to: "offices#sign_up_process"
  get "/sign_in", to: "offices#sign_in", as: :sign_in
  post "/sign_in", to: "offices#sign_in_process"
  get "/sign_out", to: "offices#sign_out", as: :sign_out
  
  resources :offices do
    member do
      get "/top", to: "offices#top"
      get "/customers_list", to: "customer#list"
      get "/claim_category", to: "service#index"
    end
    
  end
  resources :customer do
      member do
        get "/delete", to: "customer#delete"
        get "/claim", to: "customer#claim"
        
      end
  end
  
  resources :service do 
    member do 
      get "/sm_services", to: "service#sm_services"
      get "/nd_services", to: "service#nd_services"
      get "/common_services", to: "service#common_services"
    end
  end
end