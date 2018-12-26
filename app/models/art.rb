class Art < ApplicationRecord
  belongs_to :artist
  mount_uploader :image, ImageUploader
  # geocoded_by :address
  # after_validation :geocode

  def geocode
    location_link = self.location_link
    s = location_link.split("@")
    t = s[1].split(",")
    self.latitude = t[0]
    self.longitude = t[1]
  end
end
