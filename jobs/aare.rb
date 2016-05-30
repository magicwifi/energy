#!/usr/bin/env ruby
require 'open-uri'
require 'json'

SCHEDULER.every '30m', :first_in => 0 do |job|
  url = URI.parse('http://110.76.185.87/gaoxin/812_wendu.php')
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  }
  parsed  = JSON.parse(res.body)
  temperature = parsed["wendu"]
  send_event('aare', { temperature: temperature })
end
