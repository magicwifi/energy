#!/usr/bin/env ruby
require 'open-uri'
require 'json'

current_valuation = 0
current_karma = 0
current_newcome = 0

SCHEDULER.every '5s' do
  last_valuation = current_valuation
  last_newcome = current_newcome
  last_karma     = current_karma
  current_newcome = rand(30)
  current_karma     = rand(200000)
  url = URI.parse('http://219.141.189.132/gaoxin/812_guangzhao.php')
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  }
  parsed  = JSON.parse(res.body)
  current_valuation = parsed["guangzhao"].to_f

  url = URI.parse('http://219.141.189.132/gaoxin/812_gonglv.php')
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  }
  parsed  = JSON.parse(res.body)
  current_karma = (parsed["gonglv"].to_f.round(2))*1000

  send_event('valuation', { current: current_valuation, last: last_valuation })
  send_event('newcome', { current: current_newcome, last: last_newcome })
  send_event('karma', { current: current_karma, last: last_karma })
  send_event('synergy',   { value: 78 })
end
