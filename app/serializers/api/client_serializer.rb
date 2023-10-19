class Api::ClientSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :phone, :avatar

  def avatar
    object.avatar.url if object.avatar.attached?
  end
  
end
