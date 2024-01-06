# frozen_string_literal: true

require "test_helper"

class TestIpgeobase < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil Ipgeobase::VERSION
  end

  def test_it_does_something_useful # rubocop:disable Metrics/MethodLength
    stub_request(:any, "http://ip-api.com/xml/83.169.216.199")
      .to_return body: "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
          <query>
            <status>success</status>
            <country>Russia</country>
            <countryCode>RU</countryCode>
            <region>SVE</region>
            <regionName>Sverdlovsk Oblast</regionName>
            <city>Yekaterinburg</city>
            <zip>620002</zip>
            <lat>56.8439</lat>
            <lon>60.6524</lon>
            <timezone>Asia/Yekaterinburg</timezone>
            <isp>PJSC MegaFon</isp>
            <org>PJSC MegaFon GPRS/UMTS Network</org>
            <as>AS31224 PJSC MegaFon</as>
            <query>83.169.216.199</query>
          </query>
        "

    result = Ipgeobase.lookup "83.169.216.199"

    assert result.country == "Russia"
    assert result.countryCode == "RU"
    assert result.city == "Yekaterinburg"
    assert result.lat == 56.8439 # rubocop:disable Lint/FloatComparison
    assert result.lon == 60.6524 # rubocop:disable Lint/FloatComparison
  end
end
