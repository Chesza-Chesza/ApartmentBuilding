class ApartmentsController < ApplicationController
  before_action :set_apartment, only: %i[ show edit update destroy ]
  #before_action :set_building, only: %i[ create edit update ]

  def index
    @building = Building.find(params[:building_id])
    @apartments = @building.apartments
  end

  def new
    @apartment = Apartment.new
    @building = Building.find(params[:building_id])
  end

  def create
    building = Building.find(params[:building_id])
    @apartment = Apartment.new(apartment_params.merge(building_id: building.id))

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to building_apartments_path(building.id), notice: "Apartment was successfully created." }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @building = Building.find(params[:building_id])
    @apartment = Apartment.find(params[:id])
  end

  private
  def set_apartment
    @apartment = Apartment.pluck(:name, :id)
  end
  #Strong params
  def apartment_params
    params.require(:apartment).permit(:number, :building_id)
  end
end
