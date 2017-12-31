class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy

  validates :name,       presence: true, uniqueness: true
  has_one :image, dependent: :destroy

end
