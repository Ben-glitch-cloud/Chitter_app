ENV['ENVIRONMENT'] = 'test'  

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end 

require File.join(File.dirname(__FILE__), '..', 'app.rb') 

require 'capybara' 
require 'capybara/rspec' 
require 'rspec' 
require_relative './setup_test_database.rb'

Capybara.app = Chitter

RSpec.configure do |config|
  config.after(:suite) do
  end
end
