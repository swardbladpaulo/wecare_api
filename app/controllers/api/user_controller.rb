class Api::UserController < ApplicationController
  before_action :authenticate_user!
  before_action :find_resource
  # validates_presence_of  :user, :company_name

  def show
    render json: @user_profile
  end

  def update
    if user_profile_params.value?('')
      render json: { message: 'Fields can not be empty' }, status: 400
    elsif @user_profile.persisted?
      @user_profile.update(user_profile_params)
      render json: @user_profile
    else
      render json: { message: 'wrong wrong wrong' }
    end
  end
  # def update
  #   if @user_profile.persisted?
  #     @user_profile.update(user_profile_params)
  #     render json: @user_profile
  #   else
  #     render json: { message: 'There has been an error' }
  #   end
  # end

  private

  def user_profile_params
    params.permit(:company_name, :adress, :city, :zipcode)
  end

  def find_resource
    @user_profile = User.find(params[:id])
  end
end
