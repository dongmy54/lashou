Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get 'register', to: 'applicants#new'
  get 'login',    to: 'applicant_sessions#new'
  post 'login',   to: 'applicant_sessions#create'
  delete 'exit',  to: 'applicant_sessions#destroy'
  
  resources :applicants
end
