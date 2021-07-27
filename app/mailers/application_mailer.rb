class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.abby_email
  layout 'mailer'
  
  def dear_abby_submission(email, submission, index)
    email ||= 'hi@example.com'
    @submission = submission
    @id_string = index.to_s.rjust(4, "0") + " - " + Date.today.strftime("%m%d%Y") + "EM"
    mail to: email, subject: @id_string
  end
  
  def dear_abby_poll_submission(email, submission, index)
    email ||= 'hi@example.com'
    @submission = submission
    @id_string = index.to_s.rjust(4, "0") + " - " + Date.today.strftime("%m%d%Y") + "EM"
    mail to: email, subject: @id_string
  end
end
