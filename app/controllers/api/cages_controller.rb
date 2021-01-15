class Api::CagesController < ApplicationController
  def index
    @api_cages = Cage.all
  end

  def show
    @api_cage = Cage.includes(:dinosaurs).find(params[:id])
  end
end
