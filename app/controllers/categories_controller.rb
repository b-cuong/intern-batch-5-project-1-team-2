class CategoriesController < ApplicationController
  def show
    @category = Category.find params[:id]
    @tourist_areas = @category.tourist_areas.paginate page: params[:page]
  end
end
