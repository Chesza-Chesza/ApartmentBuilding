class ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.all
  end

  def new
    @apartment = Apartment.new
    @building = Building.pluck(:id, :name)
  end

  def create
  end
end
