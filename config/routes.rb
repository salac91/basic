Rails.application.routes.draw do
  
  root to: 'pages#index'

  devise_for :users

  resources :users do
  	resources :articles do
      resources :comments do
        member do
          put 'abuse'
        end
      end
  	end
  end

end
