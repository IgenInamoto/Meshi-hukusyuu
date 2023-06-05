class PostImagesController < ApplicationController
  
  def new
    @post_image = PostImage.new
  end
  
  # 投稿データの保存 
  def create
    @post_image = PostImage.new(post_image_params) # フォームに入力されたデータ(shop_name や caption,image など)が、@post_image に格納される
    @post_image.user_id = current_user.id # post_imageの投稿の user_id としてcurrent_user.id の値を代入する、という意味
    if @post_image.save                      # current_user は、コードに記述するだけで、ログイン中のユーザーの情報を取得できる便利な記述。
       redirect_to post_images_path         # ヘルパーメソッドと呼ばれるものの一種で、devise をインストールすることで使えるようになる。
    else
       render :new
    end
  end

  def index
    @post_images = PostImage.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end
  
  # 投稿データのストロングパラメータ
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  # post_image_paramsメソッドでは、フォームで入力されたデータが、投稿データとして許可されているパラメータかどうかをチェックしている。
  
end
