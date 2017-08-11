Rails.application.routes.draw do
  devise_for :groups
  get 'groups/index'

  resources :events
  resources :groups do
    resources :chats, only: [:index, :show, :create]
  end


  resources :posts do
    collection do 
      get 'search'
    end
    resources :comments
  end

  resources :messages, only:[:create]

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  
  # For chat to work set chat index as root file 
  # root 'chats#index'

end
