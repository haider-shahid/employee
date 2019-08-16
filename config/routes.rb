Rails.application.routes.draw do
  resources :employees
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  get 'signup', to:'users#new'
  get 'login' , to: 'session#new'
  post 'login', to: 'session#create'
  delete 'login',to: 'session#delete'
  resources :users,except:[:new]
end
