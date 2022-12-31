class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }


  has_many :posts, dependent: :destroy, foreign_key: :post_user_id
  # has_many :events, dependent: :destroy, foreign_key: :event_user_id
  has_one_attached :avatar

  mount_uploader :image, ImageUploader

  # お試し用
  def posts
    Post.where(user_id: self.id)
  end

  def events
    Event.where(user_id: self.id)
  end
end
