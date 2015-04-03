require 'rails_helper'

describe ArticleHelper do
  helper ArticleHelper

  describe "#article_title_font" do
    it "returns a font family" do
      expect(article_title_font(0)).to match(/^font-family/) 
    end
  end
end
