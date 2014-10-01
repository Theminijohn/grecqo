class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	def remember_me
		(super == nil) ? '1' : super
	end
end
