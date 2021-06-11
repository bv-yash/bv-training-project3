Rails.application.routes.draw do
        root 'pages#home'

        devise_config = ActiveAdmin::Devise.config
        devise_config[:controllers][:omniauth_callbacks] = 'omniauth_callbacks'
        devise_for :admin_users, devise_config
        ActiveAdmin.routes(self)

        resources :articles        
        devise_for :users
end
