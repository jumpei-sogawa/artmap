class Art < ApplicationRecord
  belongs_to :artist
  mount_uploader :image, ImageUploader
  # geocoded_by :address
  # after_validation :geocode
  is_impressionable


  def geocoded_by_lctn
    location_link = self.location_link
    s = location_link.split("@")
    t = s[1].split(",")
    self.latitude = t[0]
    self.longitude = t[1]
  end

  def geocoded_by_strv
    view_link = self.view_link
    s = view_link.split("@")
    t = s[1].split(",")
    self.latitude = t[0]
    self.longitude = t[1]
  end
end
