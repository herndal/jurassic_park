require 'rails_helper'

RSpec.describe "Api::Dinosaurs", type: :request do
  it "can be queried by species" do
    rex = Dinosaur.create!(name: "rex", species: "Tyrannosaurus")
    bore = Dinosaur.create!(name: "bore", species: "Tyrannosaurus")
    mutt = Dinosaur.create!(name: "mutt", species: "Velociraptor")
    butt = Dinosaur.create!(name: "butt", species: "Tyrannosaurus")
    get api_dinosaurs_path(species: "Tyrannosaurus")
    parsed_dinos = JSON.parse(response.body)
    expect(parsed_dinos.length).to eq(3)
    get api_dinosaurs_path(species: "Velociraptor")
    parsed_dinos = JSON.parse(response.body)
    expect(parsed_dinos.length).to eq(1)
  end
end

# When querying dinosaurs they should be filterable by species