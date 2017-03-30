class Listing < ApplicationRecord

# Validaitons
validates :title, presence: true

# Associations
belongs_to :user
has_many :reservations

# Pagination - gem 'kaminari'
paginates_per 5

# Image Uploading - gem 'Carrierwave'
serialize :photos, Array
mount_uploaders :photos, PhotoUploader

end
