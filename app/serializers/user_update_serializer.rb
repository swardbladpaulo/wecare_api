class UserUpdateSerializer < ActiveModel::Serializer
  attributes :id, :image, :company_name, :adress, :zipcode, :city

  def image
    return nil unless object.image.attached?

    if Rails.env.test?
      ActiveStorage::Blob.service.path_for(object.image.key)
    else
      object.image.service_url(expires_in: 1.hour, disposition: 'inline')
    end
  end
end
