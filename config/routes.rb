Rails.application.routes.draw do
  devise_for :users
  devise_for :installs
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index', as: 'home'
  
  get 'about' => 'pages#about', as: 'about'

  resources :posts do
    resources :comments
  end
end
