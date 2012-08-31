class FeedbackMailer < ActionMailer::Base
  default from: "contact@screenforall.com"
  
  def feedback_submission(feedback)
    @feedback = feedback
    mail(:to => 'mona.parikh.esq@gmail.com', :subject => "SFA Feedback Submission")
  end
end
