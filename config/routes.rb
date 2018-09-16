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

    # 公司申请 登录相关
    get 'apply',           to: 'companies#new'
    get 'company_login',   to: 'company_sessions#new'
    post 'company_login',  to: 'company_sessions#create'
    delete 'company_exit', to: 'company_sessions#destroy'

    # 公司后台 登录相关
    get 'account_login',   to: 'account_sessions#new'
    post 'account_login',  to: 'account_sessions#create'
    delete 'account_exit', to: 'account_sessions#destroy'

    # 后台处理
    get 'overview', to: 'main#overview'

    resources :companies, only: [:show,:create]
    resources :jobs
  end


end
