class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  serialize :image, JSON

  validates :name,       presence: true, uniqueness: true
  has_one :image, dependent: :destroy

  
end
