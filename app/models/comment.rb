class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  
  after_create :send_email
  
  validates_presence_of :body
  
  private

  def send_email
    CommentMailer.comment_email(self).deliver
  end
end
