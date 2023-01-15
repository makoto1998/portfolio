class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  has_many :posts, dependent: :destroy, foreign_key: :user_id
  # has_many :events, dependent: :destroy #これ入れるとエラーが出る。入れないとカレンダーDBが残ったままになる

end
