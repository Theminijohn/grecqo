class Player < ActiveRecord::Base

	self.primary_key = 'grepo_id'

	# Associations
	has_many :towns
	belongs_to :alliance, touch: true
	has_many :conquers, class_name: 'Conquer', foreign_key: :new_player_id

	# Public Activity
	include PublicActivity::Common

	# Follow
	acts_as_followable
	
end
