# encoding: UTF-8

@ips = `ip -f inet addr show`
@ips = @ips.scan(/\d+\.\d+\.\d+\.\d+/)
for ip in @ips do
  if ip != '127.0.0.1'
    $gip = ip
    break
  end
end

もし(/^([\w\-]+) は sourceが グローバルIP で (\w+) の (\d+) 番ポートがLISTENしている$/) do |daemon,protocol,port|
  @response = `netstat -an|grep LISTEN|grep '#{$gip}.#{port} '`
  raise unless @response != ''
end

もし(/^([\w\-]+) は sourceが ローカルIP で (\w+) の (\d+) 番ポートがLISTENしている$/) do |service,protocol,port|
  @response = `netstat -an|grep LISTEN|grep '127.0.0.1.#{port}' `
  raise unless @response != ''
end

もし(/^([\w\-]+) は sourceが '(\d+\.\d+\.\d+\.\d+)' で (\w+) の (\d+) 番ポートがLISTENしている$/) do |service,sourceip,protocol,port|
  @response = `netstat -an|grep LISTEN|grep '#{sourceip}.#{port}' `
  raise unless @response != ''
end
