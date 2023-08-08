# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "beehiiv"
  spec.version       = "0.1.4"
  spec.authors       = ["Manuel Tinio"]
  spec.summary       = "A beehiiv gem derived from xaablaza's beehiiv_client shard"
  spec.description   = "A Beehiiv API wrapper for the Ruby language derived from xaablaza's beehiiv_client shard"
  spec.email         = "manuel@hostari.com"
  spec.homepage      = "https://github.com/hostari/beehiiv_client_ruby"
  spec.license       = "MIT"
  spec.platform      = Gem::Platform::RUBY
  spec.files         = Dir["lib/**/*"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.2.0"

  spec.add_development_dependency "rubocop", "~> 1.55", ">= 1.55.1"
  spec.add_development_dependency "rubocop-rspec", "~> 2.23"
  spec.add_development_dependency "webmock", "~> 3.18.1"

  spec.add_dependency "faraday", "~> 2.7", ">= 2.7.10"
  spec.add_dependency "require_all", "~> 3.0"
end
