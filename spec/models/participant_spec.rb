require 'rails_helper'

RSpec.describe Participant, type: :model do
  subject { create(:participant) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(200) }
  it { should validate_uniqueness_of(:name).scoped_to(:user_id) }
  it { should have_many(:orders).dependent(:destroy) }
end
