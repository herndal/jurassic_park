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
  belongs_to :cage, optional: true

  def type
    ['Tyrannosaurus',
    'Velociraptor',
    'Spinosaurus',
    'Megalosaurus'].include?(species) ?
    "Carnivore" : "Herbivore"
  end

  def move(new_cage_id)
    new_cage = Cage.find(new_cage_id)
    if !new_cage.is_active
      errors[:base] << "Cannot move into a cage that is powered down" 
    elsif new_cage.full?
      errors[:base] << "Cannot move into a cage that is at capacity"
    else
      self.cage_id = new_cage_id
      self.save
    end
  end
end
