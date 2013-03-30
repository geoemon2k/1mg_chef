# encoding: UTF-8
require 'open-uri'
require 'rspec/expectations'

前提(/^: Hostヘッダ に "([\w\.]+)" をつけてHTTPでグローバルIPにリクエストする$/) do |host_header|
  @ips = `ip -f inet addr show`
  @ips = @ips.scan(/\d+\.\d+\.\d+\.\d+/)
  for ip in @ips do
    if ip != '127.0.0.1'
      @gip = ip
      break
    end
  end

  @resource = open("http://#{@gip}", "Host" => host_header)
end

ならば(/^: レスポンスステータスが (\d+) だ$/) do |status|
  @resource.status[0].should == status
end

ならば(/^: コンテンツに (.+) が含まれる$/) do |contents|
  @resource.read.should match(contents)
end
