# encoding: UTF-8
require 'open-uri'
require 'rspec/expectations'

前提(/^: Hostヘッダ に "([\w\.]+)" をつけてHTTPでグローバルIPにリクエストする$/) do |host_header|
  @gip = `ip -f inet addr show eth0`
  @gip = @gip.scan(/\d+\.\d+\.\d+\.\d+/)

  @resource = open("http://#{gip[0]}", "Host" => host_header)
end

ならば(/^: レスポンスステータスが (\d+) だ$/) do |status|
  @resource.status[0].should == status
end

ならば(/^: コンテンツに ([\w\.]+) が含まれる$/) do |hostname|
  @resource.read.should match(hostname)
end
