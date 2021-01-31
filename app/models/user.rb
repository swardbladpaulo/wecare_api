class User < ActiveRecord::Base
  extend Devise::Models

  after_initialize :set_default_role, if: :new_record?

  enum role: %i[donor]

  has_many :foodbags, foreign_key: 'donor_id'
  has_one_attached :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  private

  def set_default_role
    self.role ||= :donor
  end
end
