class Apartment < ApplicationRecord
  belongs_to :owner
  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    street_1.to_s + ' ' + street_2.to_s + ', ' + city.to_s + ', ' + state.to_s + ', ' + country.to_s + ', ' + zip.to_s
  end

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :image, presence: true,
      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
      size: { in: 0..10.megabytes }

end
