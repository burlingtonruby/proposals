ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'capybara/rails'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(
    app,
    phantomjs_logger: IO.sysopen(File::NULL)
  )
end

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  fixtures :all

  def sign_in user
    session[:user_id] = user.id
  end
end

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
  provider: 'github',
  uid: '123545',
  info: {name: 'my name'}
})

# To add additional mock data use this:
# OmniAuth.config.add_mock(:github, {info: {name: 'pete'}})

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def login_user(user)
    OmniAuth.config.add_mock(:github, uid: user.uid, info: {name: user.name})
  end
end
