class Api::UserController < ApplicationController
  before_action :authenticate_user!
  before_action :find_resource, only: :show

  def show
    render json: @user_profile
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user_profile = User.find(params[:id])
    @user.update

    private

    def find_resource
      @user_profile = User.find(params[:id])
    end
  end
end