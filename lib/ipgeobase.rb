# frozen_string_literal: true

require "net/http"
require "uri"

require_relative "ipgeobase/version"
require_relative "ipgeobase/data"

module Ipgeobase # rubocop:disable Style/Documentation
  class Error < StandardError; end

  def self.lookup(ip)
    uri = URI.parse("http://ip-api.com/xml/#{ip}")
    response = Net::HTTP.get_response(uri)

    Data.parse(response.body)
  end
end
