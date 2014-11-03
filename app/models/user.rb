class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Follow
  acts_as_follower

  # Associations
  has_many :statuses

  # Remember me always yes
	def remember_me
		(super == nil) ? '1' : super
	end
end
