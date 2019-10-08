class TouristAreasController < ApplicationController
  def index
    @tourist_areas = TouristArea.paginate page: params[:page]
  end
end
