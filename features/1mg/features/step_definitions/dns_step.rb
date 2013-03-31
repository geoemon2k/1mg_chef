# encoding: UTF-8
require 'resolv'

@ips = `ip -f inet addr show`
@ips = @ips.scan(/\d+\.\d+\.\d+\.\d+/)
for ip in @ips do
  if ip != '127.0.0.1'
    $gip = ip
    break
  end
end

もし(/^: 権威DNS グローバルIPアドレスへ ([\w\.]+) の SOA レコードを問い合わせる$/) do |domain|
  $resolver = Resolv::DNS.new(:nameserver => ["#{$gip}"])
  @response = $resolver.getresource('yahoo.co.jp', Resolv::DNS::Resource::IN::SOA)
end

ならば(/^: serialが取得できる$/) do
  @response.serial != ''
end

もし(/^: キャッシュDNS グローバルIPアドレスへ yahoo.co.jp を問い合わせることができない$/) do
  begin
    @response = $resolver.getaddress('yahoo.co.jp')
  rescue
    p
  end
end
