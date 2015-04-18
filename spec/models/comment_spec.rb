require "rails_helper"

describe Comment do
  
  it { should belong_to(:article) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:body) }
  
  describe 'after_save' do
    it 'sends an email' do
      comment = Comment.new
      expect(comment).to receive(:send_email)
      comment.run_callbacks(:create)
    end
  end
end