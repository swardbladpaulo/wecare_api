class Api::UserController < ApplicationController
  before_action :authenticate_user!
  before_action :find_resource

  def show
    render json: @user_profile
  end

  def update
   if @user_profile.persisted? 
    @user_profile.update(user_profile_params)
    render json: @user_profile
  else
    render json:{message: 'There has been an error'}
  end 
end 
    private

    def user_profile_params
      params.permit(:company_name, :adress, :city, :zipcode)
    end

    def find_resource
      @user_profile = User.find(params[:id])
    end
  end
