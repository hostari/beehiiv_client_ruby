# frozen_string_literal: true

class Beehiiv
  class ReferralProgram
    include JSON

    def self.list(client, id)
      response = client.get("/v2/publications/#{id}/referral_program")

      return Beehiiv::Error.new(response.body) unless response.status == 200

      Beehiiv::List.new(JSON.parse(response.body))
    end

    class Reward
      include JSON

      attr_reader :id, :name, :description, :image_url, :type

      def initialize(reward)
        @id = reward["id"]
        @name = reward["name"]
        @description = reward["description"]
        @image_url = reward["image_url"]
        @type = reward["type"]
      end
    end

    attr_reader :id, :auto_fulfill, :num_referrals, :reward

    def initialize(response)
      data = response["data"]
      @id = data["id"]
      @auto_fulfill = data["auto_fulfill"]
      @num_referrals = data["num_referrals"]
      @reward = data["reward"]
    end
  end
end
