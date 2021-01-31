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

  def image_path
    Rails.env.test? ? ActiveStorage::Blob.service.path_for(image.key) : image.service_url(expires_in: 1.hour, disposition: 'inline')
  end

  def set_default_role
    self.role ||= :donor
  end
end
