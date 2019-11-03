class Property < ApplicationRecord
	# TODO: should belong to a user

	mount_uploader :photo, PhotoUploader
	
	validates :name, presence: true, uniqueness: true
	validates :photo, presence: true
end
