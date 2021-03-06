class Message < ActiveRecord::Base

	belongs_to :recipient, class_name: "User"
	belongs_to :receiver, class_name: "User"

	validates :message_text, presence: true

end
