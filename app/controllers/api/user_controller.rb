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
    elsif @user_profile.persisted?
binding.pry
      # @user_profile.update(user_profile_params)
      # @user_profile.save
      binding.pry
      attach_image(user)
      binding.pry
      render json: @user_profile, serializer: UserUpdateSerializer
    else
      render json: { message: 'Something went wrong' }
    end
  end

  private

  def attach_image(user)
    params_image = params[:image]
    binding.pry
    DecodeService.attach_image(params_image, user.image) if params_image.present?
binding.pry
  end

  def user_profile_params
    params.permit(:company_name, :adress, :city, :zipcode, :image, :id)
  end

  def find_resource
    @user_profile = User.find(params[:id])
  end
end
