Rails.application.routes.draw do
  devise_for :users,
  controllers: { registrations: 'registrations' } 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # ここにpagesコントローラーのhomeアクションのルーティングを追加する
  root 'posts#index'
  # ここにusersコントローラーのshowアクションのルーティングを追加する
  get '/users/:id', to: 'users#show', as: 'user'

  resources :posts, only: %i(index new create show destroy) do
    resources :photos, only: %i(create)
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end
end
