class User < ActiveRecord::Base
extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :foodbags, foreign_key: "donor_id"
end
