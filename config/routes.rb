Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    resources :lists do
      resources :tasks
    end
  end  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
