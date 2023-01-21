class Post < ApplicationRecord
  belongs_to :user
  # validates :user_id, {presence: true}

  # def user
  #   User.find_by(id: self.user_id)
  # end
end
