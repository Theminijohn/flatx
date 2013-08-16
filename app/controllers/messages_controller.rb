class MessagesController < ApplicationController
	before_filter :authenticate_user!, only: [:index, :create, :new]

	def index
		@messages = Message.where(receiver_id: current_user.id)
	end

	def create
		message = Message.new(message_params)
		message.recipient_id = current_user.id
		if message.save
			flash[:success] = "Message was sent successfully"
			redirect_to messages_path
		else
			flash[:error] = message.errors.full_messages.join(", ")
			redirect_to new_message_path
		end
	end

	def new
		@message = Message.new
	end

	def inbox
		@message = Message.where(id: params[:id], receiver: current_user.id).first
		if @message.nil?
			redirect_to :index
		end
	end

	def sent
		@message = Message.where(id: params[:id], recipient: current_user.id).first
		if @message.nil?
			redirect_to :index
		end
	end

	def message_params
		params.require(:message).permit(:receiver_id, :message_text, :subject, :message)
	end

end
