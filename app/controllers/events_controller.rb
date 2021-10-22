require 'uri'
require 'net/http'
require 'json'

class EventsController < ActionController::Base
  def index
    uri = URI.parse('https://api.getgalore-staging.com/v1/events')

    req = Net::HTTP::Get.new(uri)
    req['Api-key'] = ENV['API_KEY']
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    res = http.request(req)
    data = JSON.parse(res.body, symbolize_names: true)

    @series = data[:series]
    @activities = data[:activities]
  end
end