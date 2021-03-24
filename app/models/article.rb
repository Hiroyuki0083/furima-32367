class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # ActiveHashを利用するモデルクラスは、ActiveHash::Baseを継承する
end
