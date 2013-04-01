# encoding: UTF-8
require 'systemu'

前提(/^: ([\w\-]+) の exit_statusが (\d) だ$/) do |daemon,exit_status|
  result = systemu "/etc/init.d/#{daemon} status"
  raise if result[0].exitstatus == exit_status
end
