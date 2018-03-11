class User < ApplicationRecord
  validates :line_key, length: { maximum: 200 }, uniqueness: true
end
