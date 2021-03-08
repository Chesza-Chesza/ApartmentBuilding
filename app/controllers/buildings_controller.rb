class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
  end

  def new
  end

  def show
  end
end
