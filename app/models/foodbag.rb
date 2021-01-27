class Foodbag < ApplicationRecord
  enum pickuptime: [:morning, :afternoon, :evening]
  enum status: [:available, :reserved, :collected]
  validates_presence_of :pickuptime, :status
end
