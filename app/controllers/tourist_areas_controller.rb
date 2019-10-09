class TouristAreasController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]
  before_action :correct_user, only: :destroy
  before_action :get_tourist_area, only: [:show, :update, :edit]

  def new
    @tourist_area = TouristArea.new
  end

  def index
    @tourist_areas = TouristArea.paginate page: params[:page]
  end

  def show; end

  def create
    @tourist_area = current_user.tourist_areas.build tourist_area_params
    if @tourist_area.save
      flash[:success] = t(".success")
      redirect_to root_url
    else
      render "pages/home"
    end
  end

  def edit; end

  def update
    if @tourist_area.update tourist_area_params
      flash[:success] = t(".success")
      redirect_to @tourist_area
    else
      render "edit"
    end
  end

  def destroy
    @tourist_area.destroy
    flash[:success] = t(".success")
    redirect_to request.referer || root_url
  end

  private

    def tourist_area_params
      params.require(:tourist_area).permit(:name, :address, :phone_number, :introduce, :user_id, :category_id)
    end

    def correct_user
      redirect_to root_url unless current_user.tourist_areas.find params[:id]
    end

    def get_tourist_area
      @tourist_area = TouristArea.find params[:id]
    end
end
