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
  @ips = `ip -f inet addr show`
  @ips = @ips.scan(/\d+\.\d+\.\d+\.\d+/)
  for ip in @ips do
    if ip != '127.0.0.1'
      @gip = ip
      break
    end
  end
  
  require 'socket'
  s = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
  sockaddr = Socket.sockaddr_in("#{port}", "#{@gip}")
  begin
    ret = s.connect(sockaddr)
  rescue
  end
  if ret == 0
    raise
  end
end
