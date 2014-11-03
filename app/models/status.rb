class Status < ActiveRecord::Base

	# Associations
	belongs_to :user

	# Validations
	validates :title, :status, presence: true

end
