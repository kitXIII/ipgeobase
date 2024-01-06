# frozen_string_literal: true

require_relative "ipgeobase/version"

module Ipgeobase # rubocop:disable Style/Documentation
  class Error < StandardError; end

  def self.lookup
    true
  end
end
