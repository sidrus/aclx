class Vehicle < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle_color, foreign_key: "color_id"
  belongs_to :vehicle_edition, foreign_key: "edition_id"
  belongs_to :vehicle_model, foreign_key: "model_id"
  belongs_to :vehicle_trim, foreign_key: "trim_id"

  def description
    desc = ""
    desc += "'#{self.nickname}' - " unless nickname.blank?
    desc += "#{vehicle_year} #{vehicle_model.name} #{vehicle_trim.name}"    
    desc += " #{vehicle_edition.name}" unless vehicle_edition.blank?
    desc += " (#{vehicle_color.name})"

    desc
  end

  def id_description
    desc = ""
    desc += "#{vehicle_year} #{vehicle_color.name} #{vehicle_model.name} #{vehicle_trim.name}"
    desc += " #{vehicle_edition.name}" unless vehicle_edition.blank?
    desc
  end

  def ensure_primary
    Vehicle.where('id <> ? AND user_id = ? AND is_primary', self.id, self.user.id).update_all("is_primary = 'false'")
  end
end
