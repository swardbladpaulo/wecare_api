class Api::FoodbagsController < ApplicationController

    def create
      foodbag = Foodbag.create(foodbag_params)
      if foodbag.persisted?
        render json: {message: 'Your foodbag was successfully created!'}, status: 201
      else
        render json: { message: foodbag.errors.full_messages.to_sentence }, status: 422
      end
    end

    def foodbag_params
      params.require(:foodbag).permit(:pickuptime, :status)
      
    end
end
