class PostImage < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    # "belongs to〜"とは、直訳すると「〜に属する」という意味。
    # has_many とは逆に、1:N の「N」側にあたるモデルに、belongs_to を記載する必要がある。
    # PostImage モデルに関連付けられるのは、1 つの User モデルのため、単数形の「user」になっている点に注意。
    
    validates :shop_name, presence: true
    validates :image, presence: true
    
    
    
    def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
    end
    
    def favorited_by?(user)
    favorites.exists?(user_id: user.id)
    end
    
end
