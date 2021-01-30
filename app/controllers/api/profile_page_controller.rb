class Api::ProfilePageController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: :show


  def show
    render json: @user_profile
  end

  private

  def find_user
    @user_profile = User.find(params[:id])
  end
end

