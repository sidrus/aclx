class Api::V1::AdminSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :last_sign_in_ip, :last_sign_in_at, :sign_in_count, :created_at, :updated_at

  has_many :events
  has_many :roles

  def last_sign_in_ip
    object.last_sign_in_ip.to_s if object.last_sign_in_ip
  end

  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end
end
