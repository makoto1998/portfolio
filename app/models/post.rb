class Post < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :title, presence: true
  validates :body, presence: true
  # validates :user_id, {presence: true}

  # def user
  #   User.find_by(id: self.user_id)
  # end
end
