class ConversationMailer
  def initialize(conversation_params, current_user)
    @conversation_params = conversation_params
    @current_user = current_user
  end

  def send
    current_user.send_message(recipient, body, subject)
  end

  def reply
    current_user.reply_to_conversation(conversation, body, subject)
  end

  private

  def conversation
    Mailboxer::Conversation.find(conversation_params[:conversation_id].to_i)
  end

  def recipient
    User.find(conversation_params[:recipient_id])
  end

  def body
    conversation_params[:body]
  end

  def subject
    conversation_params[:subject]
  end

  attr_reader :current_user, :conversation_params

end
