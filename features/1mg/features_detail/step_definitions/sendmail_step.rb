# encoding: UTF-8
前提(/^: rpmコマンドで ([\w]+) が取得できる$/) do |service|
  system("rpm -q #{service}")
end

前提(/^: serviceコマンドで ([\w]+) が ([\w]+) だ$/) do |service, state|
  `service sendmail status`
end

前提(/^: netstatコマンドで ([\d\.]+) でポートが (\d+) でLISTENしている$/) do |ipaddress, port|
  system("netstat -na|grep #{ipaddress}:#{port}")
end
