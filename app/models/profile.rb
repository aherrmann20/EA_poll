class Profile < ActiveRecord::Base
	# Sets up association between profile and user
	belongs_to :user
end
