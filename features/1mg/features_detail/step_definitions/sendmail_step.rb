# encoding: UTF-8

前提(/^: (\w+) の (\d+) 番ポートから外部へメールを送信ができる$/) do |hostname, port|
  require 'mail'

  mail = Mail.new do
  from    'test'
  to      'geoemon2kkk@yahoo.co.jp'
  subject 'This is Cucumber Test'
  body    'This is Cucumvber Test.'

  mail.delivery_method :smtp, { address:   #{hostname},
                              port:      #{port},
                              domain:    '1mg.org',
                              user_name: 'root',
                              password:  ($stderr.print 'password> '; gets.chomp) }
  mail.deliver!
end

前提(/^: グローバルIPの (\d+) 番ポートへの アクセスすると (\w+) が返る $/) do |port, return|
  @gip = `ip -f inet addr show eth0`
  @ip =~ /\d+\d+\d+\d+/
  p @ip 
  require 'socket'
  s = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
  sockaddr = Socket.sockaddr_in(#{port}, @gip)
end
