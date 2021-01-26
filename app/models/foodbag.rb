class Foodbag < ApplicationRecord
  enum pickuptime: [:morning, :afternoon, :evening]
  enum status: [:available, :reserved, :collected]
end
