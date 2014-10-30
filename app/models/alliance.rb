class Alliance < ActiveRecord::Base

	self.primary_key =  'grepo_id'

	# Associations
	has_many :players
	
	# Params
	def to_param
		"#{self.id}-#{self.name.downcase.gsub(" ", "-")}"
	end
end
