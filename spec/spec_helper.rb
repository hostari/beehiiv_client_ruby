# frozen_string_literal: true

require "spec_helper"
require "webmock/rspec"
WebMock.allow_net_connect!

RSpec.configure do |config|
  config.before(:each) do
    WebMock.reset!
  end
end

require_relative "../lib/beehiiv"
