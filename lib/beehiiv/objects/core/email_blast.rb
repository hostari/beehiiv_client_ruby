# frozen_string_literal: true

class Beehiiv
  class EmailBlast
    include JSON

    def self.retrieve(client, publication_id, id)
      response = client.get("/v2/publications/#{publication_id}/email_blasts/#{id}?expand=stats")

      return Beehiiv::Error.new(JSON.parse(response.body)) unless response.status == 200

      Beehiiv::EmailBlast.new(JSON.parse(response.body))
    end

    def self.list(client, publication_id)
      response = client.get("/v2/publications/#{publication_id}/email_blasts")
      
      return Beehiiv::Error.new(JSON.parse(response.body)) unless response.status == 200

      Beehiiv::List.new(JSON.parse(response.body))
    end

    attr_reader :id, :created, :status, :subject_line, :preview_text, :stats, :content

    def initialize(response)
      data = response["data"]
      @id = data["id"]
      @created = data["created"]
      @status = data["status"]
      @subject_line = data["subject_line"]
      @preview_text = data["preview_text"]
      @stats = data["stats"]
      @content = data["content"]
    end
  end
end
