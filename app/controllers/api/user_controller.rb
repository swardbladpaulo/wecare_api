class Api::UserController < ApplicationController
  before_action :authenticate_user!
  before_action :find_resource

  def show
    render json: @user_profile
  end

  def update
    if user_profile_params.value?('')
      render json: { message: 'Fields can not be empty' }, status: 400
    elsif @user_profile.persisted?
      attach_image(@user_profile_params)
      @user_profile.update(user_profile_params)
      render json: @user_profile
    else
      render json: { message: 'wrong wrong wrong' }
    end
  end

    private

    def attach_image(user_profile_params)
      params_image = params[:image]
      if params_image.present?
        binding.pry
        DecodeService.attach_image(params_image, @user_profile.image)
      end
    end

    def user_profile_params
      params.permit(:company_name, :adress, :city, :zipcode, :image)
    end

    def find_resource
      @user_profile = User.find(params[:id])
    end
end
