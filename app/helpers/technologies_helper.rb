module TechnologiesHelper
	def options_for_technology
		Technology.all.sort_by(&:name)
	end
end
