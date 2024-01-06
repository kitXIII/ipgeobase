# frozen_string_literal: true

require "happymapper"

module Ipgeobase
  class Data # rubocop:disable Style/Documentation
    include HappyMapper

    tag "query"
    element :country, String, tag: "country"
    element :countryCode, String, tag: "countryCode"
    element :city, String, tag: "city"
    element :lat, Float, tag: "lat"
    element :lon, Float, tag: "lon"
  end
end
