require "rails_helper"
require_relative "../support/thinking_sphinx"

describe Article do

  before(:each) { @article = create(:article) }

  let(:category_cats) { create(:category, name: "Cats") }
  let(:category_dogs) { create(:category, name: "Dogs") }
  let(:category_birds) { create(:category, name: "Birds") }
  
  it { should have_many(:comments) }
  it { should belong_to(:user) }
  it { should belong_to(:category) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:url) }

  describe "#cropping?" do
    
    it "is not cropping with no cropping attributes" do
      refute @article.cropping?
    end

    it "is not cropping with some cropping attributes" do
      @article.crop_x = 100
      refute @article.cropping?
    end

    it "is cropping with all cropping attributes" do
      @article.crop_x = 100
      @article.crop_y = 100
      @article.crop_w = 100
      @article.crop_h = 100
      assert @article.cropping?
    end
  end

  describe "#save_and_process" do
    it "returns false if paperclip blows up" do
      allow(@article.photo).to receive(:reprocess!).and_raise(StandardError)
      allow(@article).to receive(:cropping?).and_return(true)
      expect(@article.save_and_process).to be(false)
    end
    
    it "returns false if update fails" do
      allow(@article).to receive(:update_attributes).and_return(false)
      allow(@article).to receive(:cropping?).and_return(true)
      expect(@article.save_and_process).to be(false)
    end
    
    it "does not process photo during save when not cropping" do
      allow(@article).to receive(:cropping?).and_return(false)
      expect(@article.photo).to_not receive(:reprocess!)
      assert @article.save_and_process
    end

    it "does not process photo during save when not valid but are cropping" do
      allow(@article).to receive(:cropping?).and_return(true)
      expect(@article.photo).to_not receive(:reprocess!)
      refute @article.save_and_process({ title: "" })
    end

    it "does process photo during save when cropping" do
      allow(@article).to receive(:cropping?).and_return(true)
      expect(@article.photo).to receive(:reprocess!)
      assert @article.save_and_process
    end
    
    it "updates attributes during valid save" do
      assert @article.save_and_process({ title: "new title"})
      assert_equal @article.title, "new title"
    end

    it "does not update attributes during invalid save" do
      refute @article.save_and_process({ title: ""})
      refute_equal @article.title, "new title"
    end
  end

  describe "#filter" do
    
    it "returns an article" do
      expect(Article.filter).to include(@article)
    end
    
    context "when in a category" do
      before(:each) do
        @article.update_attributes(category: category_cats, delta: true)
        ThinkingSphinx::Test.index 'article_core', 'article_delta'
      end
      
      it "returns no articles filtering by another category" do
        expect(Article.filter(filter_mask: category_dogs.filter_mask)).to be_empty
      end
      
      it "returns the article filtering by the category" do
        filtered_articles = Article.filter(filter_mask: category_cats.filter_mask)
        expect(filtered_articles).to include(@article)
      end
    end
    
    context "when in multiple articles and categories" do
      before(:each) do
        @article.update_attributes(category: category_cats, delta: true)
        @article_two = create(:article, category: category_dogs)
        ThinkingSphinx::Test.index 'article_core', 'article_delta'
      end
      
      it "returns one article filtering by one category" do
        expect(Article.filter(filter_mask: category_cats.filter_mask)).to include(@article)
      end
      
      it "returns both articles filtering by both categories" do
        filter_mask = category_cats.filter_mask + category_dogs.filter_mask
        filtered_articles = Article.filter(filter_mask: filter_mask)
        expect(filtered_articles).to include(@article)
        expect(filtered_articles).to include(@article_two)
      end
      
      it "returns no articles when filtering by another category" do
        expect(Article.filter(filter_mask: category_birds.filter_mask)).to be_empty
      end
      
    end
  end

  

end
