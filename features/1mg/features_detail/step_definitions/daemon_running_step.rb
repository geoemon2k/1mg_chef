# encoding: UTF-8

前提(/^: (\w+) の statusが (\w+) だ$/) do |daemon,status|
  @response = system("/etc/init.d/#{daemon}" "status")
  p @response
end