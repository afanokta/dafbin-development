class UsersController < ApplicationController
  before_action :set_user, only: %i[create delete update]

  def index
    @users = User.all
    render json: @users.map(&:new_attr), status: :ok
  end

  def create
    @user = User.new(user_params)
    @user.role = 0
    render json: @user.errors, status: :unprocessable_entity unless @user.save
    render json: @user, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :phone_number, :role)
  end

  def set_user
    @user = User.find_by_id(params[:id])
    return render json: @user.errors, status: :not_found if @user.nil?
  end
end
