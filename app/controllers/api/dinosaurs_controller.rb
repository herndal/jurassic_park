class Api::DinosaursController < ApplicationController
  def index
    if params[:species]
      @api_dinosaurs = Dinosaur.where(species: params[:species])
    else
      @api_dinosaurs = Dinosaur.all
    end
  end

  def show
    @api_dinosaur = Dinosaur.find(params[:id])
  end
end
