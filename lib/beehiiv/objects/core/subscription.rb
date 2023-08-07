# frozen_string_literal: true

class Beehiiv
  class Subscription
    include JSON

    def self.retrieve(client, publication_id, id)
      response = client.get("/v2/publications/#{publication_id}/subscriptions/#{id}?expand=stats")

      return Beehiiv::Error.new(response.body) unless response.status == 200

      Beehiiv::Subscription.new(JSON.parse(response.body))
    end

    def self.list(client, publication_id)
      response = client.get("/v2/publications/#{publication_id}/subscriptions")

      return Beehiiv::Error.new(response.body) unless response.status == 200

      Beehiiv::List.new(JSON.parse(response.body))
    end

    attr_reader :id, :email, :status, :created, :subscription_tier,
                :utm_source, :utm_medium, :utm_channel, :utm_campaign,
                :referring_site, :referral_code, :stats

    def initialize(response)
      data = response["data"]
      @id = data["id"]
      @email = data["email"]
      @status = data["status"]
      @created = data["created"]
      @subscription_tier = data["subscription_tier"]
      @utm_source = data["utm_source"]
      @utm_medium = data["utm_medium"]
      @utm_channel = data["utm_channel"]
      @utm_campaign = data["utm_campaign"]
      @referring_site = data["referring_site"]
      @referral_code = data["referral_code"]
      @stats = data["stats"]
    end
  end
end
