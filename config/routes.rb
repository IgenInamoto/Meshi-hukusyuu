Rails.application.routes.draw do
  devise_for :users  # deviseモデルを作成したことで自動的に記述される
 
  root to: "homes#top"
  get "/homes/about" => "homes#about", as:"about"
  
  resources :post_images, only:[:new, :create, :index, :show, :destroy]
  resources :users, only:[:edit, :show]
end
