class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # :database_authenticatable（パスワードの正確性を検証）
  # :registerable（ユーザ登録や編集、削除）
  # :recoverable（パスワードをリセット）
  # :rememberable（ログイン情報を保存）
  # :validatable（email のフォーマットなどのバリデーション）
  
  has_many :post_images, dependent: :destroy
  # has_many=たくさん持っているという考え方
  # 「1:N」の「1」側にあたるモデルにhas_manyを記載する必要がある
  # 「dependent: :destroy」という記述があると「1:Nの1側が削除されたとき、N側を全て削除する」という機能が追加される。
  # この記述がないと「Userが削除されたときに、誰が投稿したか分からないPostImageが残る」という状態になってしまい、エラーになる。
         
         
end
