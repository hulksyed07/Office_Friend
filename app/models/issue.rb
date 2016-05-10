class Issue < ApplicationRecord
	has_many :messages, :dependent => :destroy
	belongs_to :asker, :class_name => 'User', :foreign_key => 'asker_id'
	belongs_to :technology
end
