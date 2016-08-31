#!/usr/bin/env ruby
require 'open-uri'
require 'json'

i=0
bar_counts = []

SCHEDULER.every '5s' do
  url = URI.parse('http://219.141.189.132/gaoxin/10h.php')
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  }
  parsed  = JSON.parse(res.body)
  barcounts = parsed["data"]


  for barcount in  barcounts
     bar_counts[i] = barcount["value"].to_f
     i = i+1
  end
  i=0

  send_event('bar_counts', { bar_counts: bar_counts })
end
