class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :balance

  def balance
    object.balance.to_f
  end
end
