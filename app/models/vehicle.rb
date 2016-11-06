class Vehicle < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle_color, foreign_key: "color_id"
  belongs_to :vehicle_edition, foreign_key: "edition_id"
  belongs_to :vehicle_model, foreign_key: "model_id"
  belongs_to :vehicle_trim, foreign_key: "trim_id"

  def description
    desc = ""
    desc += "'#{self.nickname}' - " unless nickname.blank?
    desc += "#{vehicle_year} #{model} #{trim}"
    desc += " #{edition}" unless edition.blank?
    desc += " (#{color})"

    desc
  end

  def color
    vehicle_color && vehicle_color.name || ""
  end

  def model
    vehicle_model && vehicle_model.name || ""
  end

  def trim
    vehicle_trim && vehicle_trim.name || ""
  end

  def edition
    vehicle_edition && vehicle_edition.name || ""
  end

  def id_description
    desc = ""
    desc += "#{vehicle_year} #{color} #{model} #{trim}"
    desc += " #{edition}" unless edition.blank?
    desc
  end

  def ensure_primary
    Vehicle.where('id <> ? AND user_id = ? AND is_primary', self.id, self.user.id).update_all("is_primary = 'false'")
  end
end
