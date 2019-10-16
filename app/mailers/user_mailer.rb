class UserMailer < ApplicationMailer
  
  def send_notification_mail(article)
    @article = article
    mail(to: User.pluck(:email), subject: 'Simple Demo to showcase Active Job')
  end
  
end
