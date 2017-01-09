module ApplicationHelper
	def get_all_technologies
		Technology.all.sort_by(&:name)
	end
end
