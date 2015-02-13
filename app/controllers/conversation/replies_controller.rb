module Conversation
  class RepliesController < ApplicationController
    def new
      render 'conversations/replies/new', layout: false, locals: { conversation: conversation }
    end

    def create
      ::ConversationMailer.new(conversation_params, current_user).reply
      @conversations = current_user.mailbox.conversations
      render 'conversations/new', locals: { conversations: @conversations }
    end

    private

    def conversation_params
      params.require(:reply).permit(:subject, :body, :conversation_id)
    end

    def conversation
      @conversation ||= Mailboxer::Conversation.find(params[:conversation_id])
    end
  end
end
