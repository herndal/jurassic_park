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
require 'rails_helper'

RSpec.describe Cage, type: :model do
  it { should validate_presence_of(:capacity) }

  it "Should know how many dinosaurs are contained" do
    cage = create(:cage)
    burt = create(:herbivore)
    nigel = create(:herbivore)
    expect(cage.size).to eq(0)
    burt.move(cage.id)
    nigel.move(cage.id)
    expect(cage.size).to eq(2)
  end

  it "Should have a power status of ACTIVE or DOWN" do
    cage = create(:cage)
    expect(cage.status).to eq('ACTIVE')
    cage.power_off
    expect(cage.status).to eq('DOWN')
  end

  it "Cannot be powered off if it contains any dinosaurs" do
    cage = create(:cage)
    gruber = create(:dinosaur)
    gruber.move(cage.id)
    cage.power_off
    expect(cage.errors[:base]).to eq(["Cannot power off while containing dinosaurs"])
  end

end

# Cages must have a maximum capacity for how many dinosaurs it can hold.
# Cages know how many dinosaurs are contained.
# Cages have a power status of ACTIVE or DOWN.
# Cages cannot be powered off if they contain dinosaurs.
