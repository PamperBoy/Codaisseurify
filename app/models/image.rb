class Image < ApplicationRecord
  belongs_to :artist

  mount_uploader :source, ImageUploader

end
