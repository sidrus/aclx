class Api::V1::EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :location, :start, :end, :poc, :published, :created_at, :updated_at, :latitude, :longitude

  belongs_to :admin

  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end
end