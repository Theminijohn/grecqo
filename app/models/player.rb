class Player < ActiveRecord::Base

	self.primary_key = 'grepo_id'

	# Associations
	has_many :towns
	
end
