class SendNotificationJob < ApplicationJob
  self.queue_adapter = :resque
  
  queue_as :default

  def perform(*article)
    UserMailer.send_notification_mail(article).deliver_now
  end
end
