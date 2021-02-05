class Api::UserController < ApplicationController
  before_action :authenticate_user!
  before_action :find_resource

  def show
    render json: @user_profile, serializer: UserUpdateSerializer
  end

  def update
    user = User.find(params[:id])
   
    if user_profile_params.value?('')
      render json: { message: 'Fields can not be empty' }, status: 400
    elsif user.update(user_profile_params)
      binding.pry
      attach_image(user) if params[:image]
      
      render json: user, serializer: UserUpdateSerializer
    else
      render json: { message: 'Something went wrong' }
    end
  end

  private

  def attach_image(user)
    binding.pry
    params_image = params[:image]
    DecodeService.attach_image(params_image, user.image) if params_image.present?
  end

  def user_profile_params
    binding.pry
    params.permit(:company_name, :adress, :city, :zipcode)
  end

  # def image_params
  #   binding.pry
  #   params.require(:image).permit!
   
  # end

  def find_resource
    @user_profile = User.find(params[:id])
  end
end
