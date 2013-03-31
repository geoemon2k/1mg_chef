# encoding: UTF-8

@ips = `ip -f inet addr show`
@ips = @ips.scan(/\d+\.\d+\.\d+\.\d+/)
for ip in @ips do
  if ip != '127.0.0.1'
    $gip = ip
    break
  end
end
  
もし(/^: グローバルIPアドレスへ ([\w\.]+) の SOA レコードを問い合わせる$/) do |domain|
  @response = `dig @#{$gip} #{domain} SOA|egrep 'status:|^#{domain}'`
end

ならば(/^: status が NOERROR で SOA レコードにシリアルが含まれている$/) do
    @response.should match(/\:\s+NOERROR\,/)
    @response.should match(/[\s\t]+IN[\s\t]+SOA[\s\t]+[\w\.\-]+\.[\s\t]+[\w\.\-]+\.[\s\t]+\d+\s+/)
p @response
end

もし(/^: グローバルIPアドレスへ yahoo.co.jp の SOA レコードを問い合わせる$/) do
  @response = `dig @#{$ip} yahoo.co.jp SOA|egrep 'status:'`
end

ならば(/^: statusが REFUSED である$/) do
    @response.should match(/\:\s+REFUSED\,/)
end
