class Foodbag < ApplicationRecord
  enum pickuptime: [:morning, :afternoon, :evening]
  enum status: [:available, :reserved, :collected]
  validates_presence_of :pickuptime, :status
  belongs_to :donor, class_name: "User"
end
