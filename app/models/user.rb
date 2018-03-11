class User < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :items, dependent: :destroy
  validates :line_key, presence: true, length: { maximum: 200 }, uniqueness: true
end
