FactoryBot.define do
  factory :order do
    participant
    item { create(:item, user: participant.user) }
  end
end
