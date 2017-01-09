class Technology < ApplicationRecord
	has_many :issues
	has_many :profile_technologies
	has_many :profiles, :through => :profile_technologies
end
