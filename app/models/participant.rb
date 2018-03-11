class Participant < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 200 }, uniqueness: { scope: :user_id }
end
