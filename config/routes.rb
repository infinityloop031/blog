Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  #devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources:articles do
    resources:comments
  end
  

  root 'welcome#index'
end
