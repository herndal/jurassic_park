require 'rails_helper'

RSpec.describe Dinosaur, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:species) }
  it { should validate_inclusion_of(:species).in_array([
    'Tyrannosaurus',
    'Velociraptor',
    'Spinosaurus',
    'Megalosaurus',
    'Brachiosaurus',
    'Stegosaurus',
    'Ankylosaurus',
    'Triceratops'
  ])}

  it { should belong_to(:cage).optional }

  it "is considered an herbivore or a carnivore, depending on its species" do
    edmund = create(:herbivore)
    bruce = create(:carnivore)
    expect(edmund.type).to eq('Herbivore')
    expect(bruce.type).to eq('Carnivore')
  end

  it "cannot be moved into a cage that is powered down" do
    lamar = create(:dinosaur)
    cage = create(:cage)
    cage.power_off
    lamar.move(cage.id)
    expect(lamar.errors[:base]).to eq(["Cannot move into a cage that is powered down"])
    expect(cage.empty?).to be true
  end

end

# Each dinosaur must have a name.
# Each dinosaur must have a species (See enumerated list below, feel free to add others).
# Each dinosaur is considered an herbivore or a carnivore, depending on its species.
# Dinosaurs cannot be moved into a cage that is powered down.