class NotificationMailer < ApplicationMailer
  default from: "testarticlescolosek@gmail.com"
  
  layout "notification_email"

  def article_removed(user)
    mail(to: user.email, subject: 'Your comment have been removed')
  end

end
