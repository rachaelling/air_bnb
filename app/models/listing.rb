class Listing < ApplicationRecord
validates :title, presence: true
belongs_to :user
paginates_per 5
serialize :photos, Array 
mount_uploaders :photos, PhotoUploader
end
