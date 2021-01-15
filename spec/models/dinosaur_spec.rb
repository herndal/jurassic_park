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

  it { should belong_to(:cage) }

  it "is considered an herbivore or a carnivore, depending on its species" do
    edmund = create(:herbivore)
    bruce = create(:carnivore)
    expect(edmund.type).to eq('Herbivore')
    expect(bruce.type).to eq('Carnivore')
  end
end

# Each dinosaur must have a name.
# Each dinosaur must have a species (See enumerated list below, feel free to add others).
# Each dinosaur is considered an herbivore or a carnivore, depending on its species.


    # it 'does not save passwords to the database' do
    #   User.create!(username: 'sunny_d', password: 'password')
    #   sunny = User.find_by(username: 'sunny_d')
    #   expect(sunny.password).not_to be('password')
    # end