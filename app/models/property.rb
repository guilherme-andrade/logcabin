class Property < ApplicationRecord
	belongs_to :user

	mount_uploader :photo, PhotoUploader
	
	validates :name, presence: true, uniqueness: true
	validates :photo, presence: true
end
