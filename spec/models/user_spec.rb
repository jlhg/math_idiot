require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }
  it { should validate_length_of(:line_key).is_at_most(200) }
  it { should validate_presence_of(:line_key) }
  it { should validate_uniqueness_of(:line_key) }
end
