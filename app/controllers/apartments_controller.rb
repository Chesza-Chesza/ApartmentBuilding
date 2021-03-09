class ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.all
  end

  def new
    @apartment = Apartment.new
    @building = Building.pluck(:id, :name)
  end

  def create
    @apartment = Building.new(params[:number])

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to @apartment, notice: "Apartment was successfully created." }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @apartment = Apartment.find(params[:id])
  end

  private
  #Strong params
  def apartment_params
    params.require(:apartment).permit(:number)
  end
end
