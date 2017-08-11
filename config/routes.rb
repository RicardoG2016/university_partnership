Rails.application.routes.draw do
  devise_for :groups
  get 'groups/index'

  resources :groups, :events

  resources :posts do
    collection do 
      get 'search'
    end
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'home#index'
end
