# frozen_string_literal: true

class Beehiiv
  class List
    include JSON

    attr_reader :data, :limit, :page, :total_results, :total_pages

    def initialize(response)
      @data = response["data"]
      @limit = response["limit"]
      @page = response["page"]
      @total_results = response["total_results"]
      @total_pages = response["total_pages"]
    end

    def each(&block)
      data.each do |i|
        block.call(i)
      end
    end
  end
end
