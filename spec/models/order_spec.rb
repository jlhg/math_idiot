require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { create(:order) }
  it { should validate_presence_of(:participant_id) }
  it { should validate_presence_of(:item_id) }
  it { should validate_uniqueness_of(:item_id).scoped_to(:participant_id) }
end
