FactoryBot.define do
  factory :cage do
    capacity { %w(1..9).sample }
  end
end
