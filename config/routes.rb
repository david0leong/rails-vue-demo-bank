Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace :api do
    namespace :v1 do
      post 'signup' => 'signup#create'
      post 'token' => 'user_token#create'

      get 'profile' => 'profile#index'

      post 'deposit' => 'account#deposit'
      post 'withdraw' => 'account#withdraw'
      post 'transfer' => 'account#transfer'
    end
  end
end
