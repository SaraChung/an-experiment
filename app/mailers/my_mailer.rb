class MyMailer < ActionMailer::Base
  default from: "from@example.com"

def receive(raw_mail)
  ActiveSupport::Notifications.instrument("receive.action_mailer") do |payload|
  mail = Mail.new(raw_mail)
  set_payload_for_mail(payload, mail)
  new.receive(mail)
end
end
