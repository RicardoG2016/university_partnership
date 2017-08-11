Rails.application.routes.draw do
  devise_for :groups
  get 'groups/index'

  resources :events
  resources :groups do
    resources :chat, only: [:index, :show, :create]
  end


  resources :posts do
    collection do 
      get 'search'
    end
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'home#index'
end
