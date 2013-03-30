# encoding: UTF-8

前提(/^: (\w+) の (\d+) 番ポートから外部へメールを送信ができる$/) do |hostname,port|
  require 'net/smtp'
  from_mail_addr = 'cucumber@localhost'
  to_mail_addr = 'geoemon2kkk@yahoo.co.jp'
  subject = 'cucumber test mail'
  message = 'sendmail-test'

  data = "Subject: #{subject}\n" + message

  Net::SMTP.start("#{hostname}", "#{port}"){ |smtp|
    smtp.sendmail data, from_mail_addr, to_mail_addr
  }
end

前提(/^: グローバルIPの (\d+) 番ポートへの アクセスするとエラーになる$/) do |port|
  @gip = `ip -f inet addr show eth0`
  @gip = @gip.scan(/\d+\.\d+\.\d+\.\d+/)
  require 'socket'
  s = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
  sockaddr = Socket.sockaddr_in("#{port}", "#{@gip[0]}")
  rise unless s.connect(sockaddr)
  s.write "quit\r\n\r\n"
end
