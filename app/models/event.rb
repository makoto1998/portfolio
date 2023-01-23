class Event < ApplicationRecord
  validates :user_id, {presence: true}
  belongs_to :post
end
