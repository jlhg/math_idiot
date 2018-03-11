class User < ApplicationRecord
  validates :line_key, presence: true, length: { maximum: 200 }, uniqueness: true
end
