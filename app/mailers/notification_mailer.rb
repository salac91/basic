class NotificationMailer < ApplicationMailer
  default from: "testarticlescolosek@gmail.com"
  
  layout "article_removed_email"

  def article_removed(user,article)
  	@user = user
  	@article = article
    mail(to: user.email, subject: 'Your comment have been removed')
  end

end
