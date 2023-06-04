class PostImage < ApplicationRecord
    
    has_one_attached :image
    belongs_to :user
    # "belongs to〜"とは、直訳すると「〜に属する」という意味。
    # has_many とは逆に、1:N の「N」側にあたるモデルに、belongs_to を記載する必要がある。
    # PostImage モデルに関連付けられるのは、1 つの User モデルのため、単数形の「user」になっている点に注意。
    
end
