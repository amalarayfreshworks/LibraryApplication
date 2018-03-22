Rails.application.routes.draw do
  resources :transactions
  resources :readers
  resources :books do
	  collection do
	    get :search
	  end
  end
  post "transactions/:transaction_id", to: 'transactions#renew'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#index'
end
