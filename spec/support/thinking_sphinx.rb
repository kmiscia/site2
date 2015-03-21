module SphinxHelpers
  def index
    ThinkingSphinx::Test.index
    sleep 0.25 until index_finished?
  end

  def index_finished?
    Dir[Rails.root.join(ThinkingSphinx::Test.config.indices_location, '*.{new,tmp}*')].empty?
  end
end

RSpec.configure do |config|

  config.include SphinxHelpers

  config.before(:suite) do  
    ThinkingSphinx::Test.init(false)
    ThinkingSphinx::Test.start_with_autostop
  end

  config.before(:each) do |example|
    index# if example[:js]
  end
end