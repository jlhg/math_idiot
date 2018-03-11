class Item < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 200 }, uniqueness: { scope: :user_id }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
