class Api::UserController < ApplicationController
  before_action :authenticate_user!
  before_action :find_resource

  def show
    render json: @user_profile, serializer: UserUpdateSerializer
  end

  def update

    if user_profile_params.value?('')
      render json: { message: 'Fields can not be empty' }, status: 400
    elsif @user_profile.persisted?

      attach_image(@user_profile)
 
      @user_profile.update(user_profile_params)
      @user_profile.save
      render json: @user_profile, serializer: UserUpdateSerializer
    else
      render json: { message: 'Something went wrong' }
    end
  end

  private

  def attach_image(_user_profile_params)
  
    params_image = params[:image]
    DecodeService.attach_image(params_image, @user_profile.image) if params_image.present?

  end

  def user_profile_params
    params.permit(:company_name, :adress, :city, :zipcode, :image, :id)
  end

  def find_resource
    @user_profile = User.find(params[:id])
  end
end
