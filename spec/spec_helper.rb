require 'devise'
require "paperclip/matchers"
require 'simplecov'
require 'capybara/rspec'

SimpleCov.start 'rails'

Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

RSpec.configure do |config|
  
  config.include Paperclip::Shoulda::Matchers
  config.include Devise::TestHelpers, :type => :controller
  
  config.raise_errors_for_deprecations!

  config.before(:suite) do
    Rails.application.load_seed
    %x[bundle exec rake assets:clean]
    %x[bundle exec rake assets:precompile]
  end
  
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  
  #config.formatter = :documentation 
  #config.profile_examples = 10
  #config.order = :random
end