class Article < ApplicationRecord
    has_many :coments, dependent: :destroy
    #@articleというインスタンス変数に記事が1つ含まれていれば、
    #@article.comentsと書くだけでその記事に関連付けられているコメントをすべて取得できます。
    validates :title,presence: true,
                     length: {minimum: 5}
end
