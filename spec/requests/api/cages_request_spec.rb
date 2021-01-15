require 'rails_helper'

RSpec.describe "Api::Cages", type: :request do
  it "must list the dinosaurs in a specific cage" do
    cage = create(:cage)
    get api_cage_path(cage.id)
    expect(response.status).to eq 200
    parsed_cage = JSON.parse(response.body)
    expect(parsed_cage).to have_key("dinosaurs")
  end
  it "can be queried by power status" do
    cage_1 = create(:cage)
    cage_2 = create(:cage)
    cage_3 = create(:cage)
    cage_4 = create(:cage)
    cage_3.power_off
    get api_cages_path(is_active: false)
    parsed_cages = JSON.parse(response.body)
    expect(parsed_cages.length).to eq(1)
    get api_cages_path(is_active: true)
    parsed_cages = JSON.parse(response.body)
    expect(parsed_cages.length).to eq(3)
  end
end

# Must be able to query a listing of dinosaurs in a specific cage.
# When querying cages they should be filterable on their power status.