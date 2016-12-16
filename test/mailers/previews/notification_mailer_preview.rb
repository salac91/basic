class ExampleMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    NotificationMailer.sample_email(User.first)
  end
end
