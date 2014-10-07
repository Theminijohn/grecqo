class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Follow
  acts_as_follower

	def remember_me
		(super == nil) ? '1' : super
	end
end
