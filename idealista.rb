require "net/http"
require "uri"

module Idealista
  def self.request(query)
    uri = URI.parse("http://idealista-prod.apigee.net/public/2/search")
    uri.query = URI.encode_www_form(query)
    $log.debug "uri:     " + uri.to_s

    http = Net::HTTP.new(uri.host, uri.port)
    response = http.request(Net::HTTP::Get.new(uri.request_uri))
    $log.info "received idealista data..."
    return response.body # JSON
  end
end