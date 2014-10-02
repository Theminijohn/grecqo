class Alliance < ActiveRecord::Base

	self.primary_key =  'grepo_id'

	# Associations
	has_many :players
	
end
