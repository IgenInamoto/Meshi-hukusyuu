Rails.application.routes.draw do
  devise_for :users  # deviseモデルを作成したことで自動的に記述される
 
  root to: "homes#top"
  get "/homes/about" => "homes#about", as:"about"
  
  resourses :post_images, only:[:new, :index, :show]
  
end
