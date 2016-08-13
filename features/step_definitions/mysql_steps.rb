require 'Open3'

When(/^i Pre\-Seed file for debconf$/) do
  command = "ansible-playbook backup.playbook.yml --tags='check_install, seed_debconf'"
  _,_, @status  = Open3.capture3 "#{command}"
end

Then(/^it should be succesful$/) do
  expect(@status.success?).to eq(true)
end

When(/^i seed the mysql file$/) do
  command = "ansible-playbook backup.playbook.yml --tags='check_install, seed_mysql_file'"
  _,_, @status  = Open3.capture3" #{command}"
end

When(/^i install mysql server$/) do
  command = "ansible-playbook backup.playbook.yml --tags='check_install,install_mysql'"
  _,_, @status  = Open3.capture3 "#{command}"
end


When(/^i delete the seed file$/) do
  command = "ansible-playbook backup.playbook.yml --tags='check_install,delete_seeds'"
  _,_, @status  = Open3.capture3 "#{command}"
end


When(/^i set my\.cnf to \/etc folder$/) do
  command = "ansible-playbook backup.playbook.yml --tags=set_cnf"
   _,_, @status  = Open3.capture3 "#{command}"
end

When(/^i Remove users with empty passwords from localhost$/) do
  command = "ansible-playbook backup.playbook.yml --tags=remove_empty_pass1"
   _,_, @status  = Open3.capture3 "#{command}"
end

When(/^i Remove ueers with empty passwords$/) do
  command = "ansible-playbook backup.playbook.yml --tags=remove_empty_pass2"
   _,_, @status  = Open3.capture3 "#{command}"
end

When(/^i Remove the test database$/) do
  command = "ansible-playbook backup.playbook.yml --tags=remove_test_database"
   _,_, @status  = Open3.capture3 "#{command}"
end