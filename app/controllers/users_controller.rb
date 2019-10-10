class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]
  before_action :logged_in_user, except: [:new, :create]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def show; end

  def new
    @user = User.new
  end

  def index
    @users = User.paginate page: params[:page]
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t(".flash_updated")
      redirect_to root_path
    else
      render :edit
    end
  end

  def create
    @user = User.new user_params
    @user.save ? (redirect_to root_path) : (render :new)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = t(".flash_deleted")
    redirect_to users_url
  end

  private

    def set_user
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
      redirect_to root_url unless current_user?(@user)
    end

    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end
