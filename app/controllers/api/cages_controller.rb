class Api::CagesController < ApplicationController
  def index
    if params[:is_active]
      @api_cages = Cage.where(is_active: params[:is_active])
    else
      @api_cages = Cage.all
    end
  end

  def show
    @api_cage = Cage.includes(:dinosaurs).find(params[:id])
  end
end
