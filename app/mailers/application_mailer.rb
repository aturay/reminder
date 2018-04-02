class ApplicationMailer < ActionMailer::Base
  default from: 'notice@reminder.com'
  layout 'mailer'
end
