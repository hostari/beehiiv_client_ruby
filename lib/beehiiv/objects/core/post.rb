# frozen_string_literal: true

class Beehiiv
  class Post
    include JSON

    def self.retrieve(client, publication_id, id)
      response = client.get("/v2/publications/#{publication_id}/posts/#{id}?expand=stats")

      raise Beehiiv::Error, response.body unless response.status == 200

      Beehiiv::Post.new(JSON.parse(response.body))
    end

    def self.list(client, publication_id)
      response = client.get("/v2/publications/#{publication_id}/posts")

      raise Beehiiv::Error, response.body unless response.status == 200

      Beehiiv::List.new(JSON.parse(response.body))
    end

    attr_reader :id, :subtitle, :title, :authors, :created, :status,
                :publish_date, :displayed_date, :split_tested, :subject_line,
                :preview_text, :slug, :thumbnail_url, :web_url, :audience,
                :platform, :content_tags, :content, :stats

    def initialize(response)
      data = response["data"]
      @id = data["id"]
      @subtitle = data["subtitle"]
      @title = data["title"]
      @authors = data["authors"]
      @created = data["created"]
      @status = data["status"]
      @publish_date = data["publish_date"]
      @displayed_date = data["displayed_date"]
      @split_tested = data["split_tested"]
      @subject_line = data["subject_line"]
      @preview_text = data["preview_text"]
      @slug = data["slug"]
      @thumbnail_url = data["thumbnail_url"]
      @web_url = data["web_url"]
      @audience = data["audience"]
      @platform = data["platform"]
      @content_tags = data["content_tags"]
      @content = data["content"]
      @stats = data["stats"]
    end
  end
end
