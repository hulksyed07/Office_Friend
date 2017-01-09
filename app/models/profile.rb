class Profile < ApplicationRecord
	belongs_to :user
	belongs_to :role
	has_many :profile_technologies
	has_many :technologies, :through => :profile_technologies
end
