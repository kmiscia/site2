require "rails_helper"
require 'paperclip'
require_relative "../support/thinking_sphinx"

describe Paperclip::ArticleCropper do

  before(:each) do
    @article = create(:article, {
      crop_x: 100,
      crop_y: 100,
      crop_w: 100,
      crop_h: 100
    })
    ThinkingSphinx::Test.index 'article_core', 'article_delta'
    sleep(3) # https://github.com/kmiscia/site2/issues/13
  end

  describe "#crop_command" do
    allow_any_instance_of(@article.photo).to receive(:instance).and_return(@article)
    expect(@article.photo.crop_command).to eql("hello")
  end

end
