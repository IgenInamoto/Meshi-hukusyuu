Rails.application.routes.draw do
  devise_for :users  # deviseモデルを作成したことで自動的に記述される
 
  root to: "homes#top"
  get "/homes/about" => "homes#about", as:"about"
  
  resources :post_images, only:[:new, :create, :index, :show, :destroy] do #ネストさせる
    resource :favorites, only:[:create, :destroy] # resourceを単数形にするとURLに/:idが含まれなくなる
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only:[:edit, :show, :update]
end
