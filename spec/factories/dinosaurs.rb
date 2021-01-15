FactoryBot.define do
  all_species = [
    'Tyrannosaurus',
    'Velociraptor',
    'Spinosaurus',
    'Megalosaurus',
    'Brachiosaurus',
    'Stegosaurus',
    'Ankylosaurus',
    'Triceratops'
  ]
  carnivores = [
    'Tyrannosaurus',
    'Velociraptor',
    'Spinosaurus',
    'Megalosaurus',
  ]
  herbivores = [
    'Brachiosaurus',
    'Stegosaurus',
    'Ankylosaurus',
    'Triceratops'
  ]
  factory :dinosaur do
    name { Faker::Artist.name }
    species { all_species.sample }
  end
  factory :carnivore, class: Dinosaur do
    name { Faker::Artist.name }
    species { carnivores.sample }
  end
  factory :herbivore, class: Dinosaur do
    name { Faker::Artist.name }
    species{ herbivores.sample }
  end
end