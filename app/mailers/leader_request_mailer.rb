class LeaderRequestMailer
  def initialize(leader_request_params, current_user)
    @leader_request_params = leader_request_params
    @current_user = current_user
  end

  def send
    admins.each do |admin|
      current_user.send_message(admin, body, subject)
    end
  end

  private

  def admins
    User.where(title: 'admin')
  end

  def body
    leader_request_params[:body]
  end

  def subject
    "Community Leader Request"
  end

  attr_reader :current_user, :leader_request_params
end
