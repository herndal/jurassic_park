require 'rails_helper'

RSpec.describe Cage, type: :model do
  it { should validate_presence_of(:capacity) }
  it { should validate_presence_of(:is_active) }

  it "Should know how many dinosaurs are contained" do
    my_cage = Cage.create!(capacity: 3)
    burt = create(:dinosaur)
    nigel = create(:dinosaur)
    expect(my_cage.size).to eq(0)
    burt.move(my_cage.id)
    nigel.move(my_cage.id)
    expect(my_cage.size).to eq(2)
  end

  it "Should have a power status of ACTIVE or DOWN" do
    my_cage = create(:cage)
    expect(my_cage.status).to eq('ACTIVE')
    my_cage.power_off
    my_cage.save
    expect(my_cage.status).to eq('DOWN')
  end

  it "Cannot be powered off if it contains any dinosaurs" do
    my_cage = create(:cage)
    gruber = create(:dinosaur)
    gruber.move(my_cage.id)
    my_cage.power_off
    expect(my_cage.errors[:base]).to eq(["Cannot power off while containing dinosaurs"])
  end

end

# Cages must have a maximum capacity for how many dinosaurs it can hold.
# Cages know how many dinosaurs are contained.
# Cages have a power status of ACTIVE or DOWN.
# Cages cannot be powered off if they contain dinosaurs.