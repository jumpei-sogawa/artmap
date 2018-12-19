class Art < ApplicationRecord
  belongs_to :artist
  mount_uploader :image, ImageUploader
  geocoded_by :address
  after_validation :geocode
end
