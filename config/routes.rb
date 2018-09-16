Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get 'register', to: 'applicants#new'
  get 'login',    to: 'applicant_sessions#new'
  post 'login',   to: 'applicant_sessions#create'
  delete 'exit',  to: 'applicant_sessions#destroy'

  resources :applicants do
    resources :resumes
  end

  # 企业版
  namespace :enterprise do
    root 'companies#new'

    get 'apply',          to: 'companies#new'
    get 'company_login',  to: 'company_sessions#new'
    post 'company_login', to: 'company_sessions#create'
    delete 'exit',        to: 'company_sessions#destroy'

    resources :companies, only: [:show,:create]
  end


end
