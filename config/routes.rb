Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "furimas#index"
  resources :furimas do
    resources :orders, only: [:index, :create]
  end
  #新たにコントローラーを作ってルーティングを指定しないといけない場合どちらが親か子か必ず指定する必要あり
  #親は必ず一つだけだから親子関係をしっかりする。
  resources :users, only: :show
end
