# frozen_string_literal: true

class Beehiiv
  class Segment
    include JSON

    def self.list(client, publication_id)
      response = client.get("/v2/publications/#{publication_id}/segments")

      raise Beehiiv::Error, response.body unless response.status == 200

      Beehiiv::List.new(JSON.parse(response.body))
    end

    def self.retrieve(client, publication_id, id)
      response = client.get("/v2/publications/#{publication_id}/segments/#{id}/results")

      raise Beehiiv::Error, response.body unless response.status == 200

      Beehiiv::Segment.new(JSON.parse(response.body))
    end

    attr_reader :id, :name, :segment_type, :last_calculated, :total_results, :status, :active

    def initialize(response)
      data = response["data"]
      @id = data["id"]
      @name = data["name"]
      @segment_type = data["segment_type"]
      @last_calculated = data["last_calculated"]
      @total_results = data["total_results"]
      @status = data["status"]
      @active = data["active"]
    end
  end
end
