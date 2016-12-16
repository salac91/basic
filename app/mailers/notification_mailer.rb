class NotificationMailer < ApplicationMailer
  default from: "testarticlescolosek@gmail.com"
  
  layout "notification_email"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Your comment have been removed')
  end

end
