class Message < ApplicationRecord
	belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
	belongs_to :issue
	after_commit { MessageRelayJob.perform_later(self) }
end
