class CommentsController < ApplicationController
  
  before_filter :honeypot_check
  before_filter :require_xhr
  
  respond_to :html
  
  def create
    
    comment = Comment.create(comment_params)

    if comment.valid?
      render partial: "/comments/comment", 
        locals: { comment: comment }, 
        layout: false, 
        status: :created
    else
      render nothing: true
    end
  end
    
  private
  
  def comment_params
    params.require(:comment).permit(:body, :article_id)
  end
  
  def honeypot_check
    return false if params[:email].present?
  end
end
