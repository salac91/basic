module ArticlesHelper

  def send_mails(article)
    Comment.where(:article_id => article.id).each do |comment|
      NotificationMailer.sample_email(User.find(comment.author_id)).deliver
    end
  end

end
