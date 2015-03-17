class ConversationMailer
  def initialize(conversation_params, current_user)
    @conversation_params = conversation_params
    @current_user = current_user
  end

  def send
    recipients.each do |recipient|
      current_user.send_message(recipient, body, subject)
    end
  end

  def reply
    current_user.reply_to_conversation(conversation, body, subject)
  end

  private

  def conversation
    Mailboxer::Conversation.find(conversation_params[:conversation_id].to_i)
  end

  def recipients
    JSON.parse(conversation_params[:recipient_ids]).map do |recipient_id|
      User.find(recipient_id.to_i)
    end
  end

  def body
    conversation_params[:body]
  end

  def subject
    conversation_params[:subject]
  end

  attr_reader :current_user, :conversation_params

end
