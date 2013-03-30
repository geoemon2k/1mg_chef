# encoding: UTF-8

require "open3"

前提(/^: ([\w]+) ユーザが存在する$/) do |username|
  $stdio, stderr, status = Open3.capture3("grep #{username} /etc/passwd")
  status == 0
  
end

ならば(/^: homedirは ([\w\/]+) だ$/) do |homedir|
  usrdataAry = $stdio.split(":")
  usrdataAry[5] == "#{homedir}"
end

ならば(/^: ([\w\.\/]+) が設置されている$/) do |ssh_key|
  system("ls #{ssh_key}")
end

