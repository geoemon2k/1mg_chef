# encoding: UTF-8
前提 /^: rpm コマンドで ([\w]+) が取得できる$/ do |service|
  system("rpm -q #{service}").should == true
end

前提 /^: service コマンド ([\w]+) の状態が ([\w]+) だ$/ do |service, state|
  `service nginx status`
end
