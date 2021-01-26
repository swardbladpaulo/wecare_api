class Api::FoodbagsController < ApplicationController

    def create
      foodbag = Foodbag.create
      if foodbag.persisted?
        render json: {message: 'Your foodbag was successfully created!'}, status: 201
      else
        render json: { message: foodbag.errors.full_messages.to_sentence }, status: 422
      end
    end
end
