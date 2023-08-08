# frozen_string_literal: true

require "json"
require "faraday"
require "uri"
require "require_all"

class Beehiiv
  BASE_URL = URI.parse("https://api.beehiiv.com/")

  def self.client(api_key)
    Faraday.new(url: BASE_URL) do |conn|
      conn.request :authorization, "Bearer", -> { api_key }
    end
  end
end

require_rel "./beehiiv"
