require 'rails_helper'

RSpec.describe "Api::Cages", type: :request do
  it "must list the dinosaurs in a specific cage" do
    cage = create(:cage)
    get api_cage_path(cage.id)
    expect(response.status).to eq 200
    parsed_cage = JSON.parse(response.body)
    expect(parsed_cage).to have_key("dinosaurs")
  end
end

# Must be able to query a listing of dinosaurs in a specific cage.