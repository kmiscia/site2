require 'rails_helper'

RSpec.describe CommentsController do

  describe "POST create" do

    it "creates and renders comments" do
      comment_attributes = FactoryGirl.attributes_for(:comment).merge({
        :article_id => build(:comment).article.id
      })
      
      expect{ xhr :post, :create, :comment => comment_attributes }.to change{Comment.count}.by(1)
      expect(response).to render_template(:partial => '_comment')
    end

    it "renders nothing when it cannot create comment" do
      allow_any_instance_of(Comment).to receive(:valid?).and_return(false)
      
      #comment_attributes = FactoryGirl.attributes_for(:comment).merge({
      #  :article_id => build(:comment).article.id
      #})
      
      expect{ xhr :post, :create, :comment => {:fu => :bar} }.to change{Comment.count}.by(0)
      expect(response.body).to be_blank
    end
  end

end
