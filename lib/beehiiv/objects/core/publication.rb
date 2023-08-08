# frozen_string_literal: true

class Beehiiv
  class Publication
    include JSON

    def self.retrieve(client, id)
      response = client.get("/v2/publications/#{id}?expand=stats")

      return Beehiiv::Error.new(JSON.parse(response.body)) unless response.status == 200

      Beehiiv::Publication.new(JSON.parse(response.body))
    end

    def self.list(client)
      response = client.get("/v2/publications/")

      return Beehiiv::Error.new(JSON.parse(response.body)) unless response.status == 200

      Beehiiv::List.new(JSON.parse(response.body))
    end

    attr_reader :id, :name, :referral_program_enabled, :stats

    def initialize(response)
      data = response["data"]
      @id = data["id"]
      @name = data["name"]
      @referral_program_enabled = data["referral_program_enabled"]
      @stats = data["stats"]
    end
  end
end
