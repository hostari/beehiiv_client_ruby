# frozen_string_literal: true

class Beehiiv
  class Stats
    include JSON

    attr_reader :active_subscriptions, :active_premium_subscriptions, :active_free_subscriptions,
                :average_open_rate, :average_click_rate, :total_sent, :total_unique_opened, :total_clicked,
                :email, :web, :clicks, :total_received, :open_rate, :click_rate

    def initialize(stats, type)
      if type == "publication"
        @active_subscriptions = stats["active_subscriptions"]
        @active_premium_subscriptions = stats["active_premium_subscriptions"]
        @active_free_subscriptions = stats["active_free_subscriptions"]
        @average_open_rate = stats["average_open_rate"]
        @average_click_rate = stats["average_click_rate"]
        @total_sent = stats["total_sent"]
        @total_unique_opened = stats["total_unique_opened"]
        @total_clicked = stats["total_clicked"]
      elsif %w[post email_blast].include?(type)
        @email = stats["email"]
        @web = stats["web"]
        @clicks = stats["clicks"] if type == "post"
      elsif type == "subscription"
        @total_sent = stats["total_sent"]
        @total_received = stats["total_received"]
        @total_unique_opened = stats["total_unique_opened"]
        @total_clicked = stats["total_clicked"]
        @open_rate = stats["open_rate"]
        @click_rate = stats["click_rate"]
      end
    end
  end
end
