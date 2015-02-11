class ConversationsController < ApplicationController

  def new
    @conversations = current_user.mailbox.conversations
  end

  def create
    ::ConversationMailer.new(conversation_params, current_user).send
    redirect_to :back
  end

  private

  def conversation_params
    params.require(:conversation).permit(:subject, :body, :recipient_id)
  end
end
