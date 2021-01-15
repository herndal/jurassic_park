FactoryBot.define do
  factory :cage do
    capacity { %w(3..9).sample }
  end
  factory :small_cage, class: Cage do
    capacity { 1 }
  end
end
