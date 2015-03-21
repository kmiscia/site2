class CommentMailer < ActionMailer::Base
  default :from => "system@miscia.net"
  
  def comment_email(comment)
    @comment = comment  
    mail(:to => SETTINGS[:site_email], :subject => "A new comment was added to #{SETTINGS[:site_domain]}")
  end
end
