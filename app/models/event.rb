class Event < ApplicationRecord
  belongs_to :admin

  geocoded_by :location
  after_validation :geocode, if: :location_valid_or_changed?

  scope :mappable_events, -> { Event.all.select {|e| e.has_mappable_location?} }
  scope :upcoming_events, -> { Event.all.where("start >= ? AND published=true", DateTime.now).order(:start) }
  scope :unpublished_upcoming_events, -> { Event.all.where("start >= ?", DateTime.now).order(:start) }

  def has_mappable_location?
    latitude.present? && longitude.present?
  end

  private
    def location_valid_or_changed?
      !location.blank? && location_changed?
    end
end
