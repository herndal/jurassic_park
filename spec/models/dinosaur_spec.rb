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

  it "cannot be caged with carnivores if it is an herbivore" do
    schmidt = create(:herbivore)
    lars = create(:carnivore)
    cage = create(:cage)
    lars.move(cage.id)
    schmidt.move(cage.id)
    expect(schmidt.errors[:base]).to eq(["Herbivores cannot be caged with carnivores"])
  end

  it "cannot be caged with other species if it is a carnivore" do
    hugh = Dinosaur.create!(name: "Hugh", species: "Tyrannosaurus")
    gar = Dinosaur.create!(name: "Gar", species: "Velociraptor")
    cage = create(:cage)
    hugh.move(cage.id)
    gar.move(cage.id)
    expect(gar.errors[:base]).to eq(["Carnivores must be caged with the same species"])
    expect(cage.dinosaurs).to eq([hugh])
  end

end

# Each dinosaur must have a name.
# Each dinosaur must have a species (See enumerated list below, feel free to add others).
# Each dinosaur is considered an herbivore or a carnivore, depending on its species.
# Dinosaurs cannot be moved into a cage that is powered down.
# Herbivores cannot be in the same cage as carnivores.
# Carnivores can only be in a cage with other dinosaurs of the same species.