class Order < ApplicationRecord
  belongs_to :participant
  belongs_to :item
  validates :participant_id, presence: true
  validates :item_id, presence: true, uniqueness: { scope: :participant_id }
end
