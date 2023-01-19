class Group < ApplicationRecord
  belongs_to :user
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
