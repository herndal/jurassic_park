# == Schema Information
#
# Table name: cages
#
#  id         :bigint           not null, primary key
#  capacity   :integer          not null
#  is_active  :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :cage do
    capacity { %w(3..9).sample }
  end
  factory :small_cage, class: Cage do
    capacity { 1 }
  end
end
