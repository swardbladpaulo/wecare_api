class Foodbag < ApplicationRecord
  enum pickuptime: %i[morning afternoon evening]
  enum status: %i[available reserved collected]
  validates_presence_of :pickuptime, :status
  belongs_to :donor, class_name: 'User'
  belongs_to :recipient, class_name: 'User', optional: true
end
