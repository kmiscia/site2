require "rails_helper"

describe Article do

  before(:each) do
    @article = create(:article)
  end

  it { should have_many(:comments) }
  it { should belong_to(:user) }
  it { should belong_to(:category) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:url) }

  it "is not cropping with no cropping attributes" do
    refute @article.cropping?
  end

  it "is not cropping with some cropping attributes" do
    @article.crop_x = 100
    refute @article.cropping?
  end

  it "is cropping when cropping attributes are present" do
    @article.crop_x = 100
    @article.crop_y = 100
    @article.crop_w = 100
    @article.crop_h = 100
    assert @article.cropping?
  end

  it "does not process photo during save when not cropping" do
    expect(@article.photo).to_not receive(:reprocess!)

    @article.save_and_process(@article.attributes)
    @article.save_and_process(@article.attributes.merge({
      crop_x: 100,
      crop_y: 100
    }))
  end

  it "does process photo during save when not valid" do
    expect(@article.photo).to_not receive(:reprocess!)

    @article.save_and_process(@article.attributes.merge({
      title: "",
      crop_x: 100,
      crop_y: 100,
      crop_h: 100,
      crop_w: 100
    }))
  end

  it "does process photo during save when not cropping" do
    expect(@article.photo).to receive(:reprocess!)

    @article.save_and_process(@article.attributes.merge({
      crop_x: 100,
      crop_y: 100,
      crop_h: 100,
      crop_w: 100
    }))
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
