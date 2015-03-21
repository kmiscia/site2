class CommentsController < ApplicationController
  
  before_filter :honeypot_check
  
  respond_to :html, :xml, :json
  
  def create
    
    comment = Comment.create(comment_params)

    if comment.valid?
      
      #TODO - How do we handle email errors and timeouts?
      CommentMailer.comment_email(comment).deliver
      
      respond_with do |format|
        format.html do
          if request.xhr?
            render :partial => "/comments/comment", :locals => { :comment => comment }, :layout => false, :status => :created
          else
            redirect_to :root
          end
        end
      end
    else
      respond_with do |format|
        format.html do
          if request.xhr?
            render :json => comment.errors, :status => :unprocessable_entity
          else
            render :action => :new, :status => :unprocessable_entity
          end
        end
      end
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
