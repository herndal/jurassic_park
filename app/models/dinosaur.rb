class Dinosaur < ApplicationRecord
  validates :name, :species, presence: true
  validates_inclusion_of :species, in: [
    'Tyrannosaurus',
    'Velociraptor',
    'Spinosaurus',
    'Megalosaurus',
    'Brachiosaurus',
    'Stegosaurus',
    'Ankylosaurus',
    'Triceratops'
  ]
  # belongs_to :cage, optional: true

  def type
    ['Tyrannosaurus',
    'Velociraptor',
    'Spinosaurus',
    'Megalosaurus'].include?(species) ?
    "Carnivore" : "Herbivore"
  end
end
