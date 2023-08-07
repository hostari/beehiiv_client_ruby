# frozen_string_literal: true

class Beehiiv
  class Error < StandardError
    attr_reader :status, :status_text, :errors

    def initialize(response)
      @status = response["status"]
      @status_text = response["statusText"]
      @errors = response["errors"]
    end
  end
end
