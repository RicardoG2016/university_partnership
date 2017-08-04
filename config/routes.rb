Rails.application.routes.draw do
  get 'groups/index'

  resources :groups do 
    resources :posts
      collection do 
        get 'search'
      end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'groups#index'
end
