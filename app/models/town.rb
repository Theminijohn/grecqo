class Town < ActiveRecord::Base

	self.primary_key = 'grepo_id'

	# Associations
	belongs_to :player, foreign_key: :player_id, touch: true

end
