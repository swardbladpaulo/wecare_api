class UserUpdateSerializer < ActiveModel::Serializer
  attributes :id, :image, :company_name, :adress, :zipcode, :city

  def image
    return nil unless object.image.attached?

    object.image_was
  end
end
