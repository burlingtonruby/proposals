class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :is_admin, :is_voter

  def is_admin
    object.admin?
  end

  def is_voter
    object.voter?
  end
end
