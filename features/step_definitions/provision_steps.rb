require "Open3"

Given(/^I have a running server$/) do
  _, _, status = Open3.capture3 "ansible tunza -m ping"
  expect(status.success?).to eq(true)
end

Given(/^I provision it$/) do
  command = "ansible-playbook provision.yml --tags=provision"
  _, _, status = Open3.capture3 "#{command}"
  expect(status.success?).to eq(true)
end

When(/^I install python\-mysqldb$/) do
  command = "ansible-playbook provision.yml --tags=python-mysqldb"
  _, _, @status = Open3.capture3 "#{command}"
end

Then(/^It should be succesful$/) do
 expect(@status.success?).to eq(true)
end

When(/^I install awscli$/) do
  command= "ansible-playbook provision.yml --tags='export_lang,python-mysqldb'"
  _, _, @status = Open3.capture3 "#{command}"
end


Then(/^it should be working well$/) do
  _, _, status = Open3.capture3 "aws help"
  expect(status.success?).to eq(true)
end

When(/^i configure aws cli$/) do
   command= "ansible-playbook provision.yml --tags='create_folder,config_cli'"
  _, _, @status = Open3.capture3 "#{command}"
end

Then(/^it should be able to connect to aws account$/) do
  _, _, status = Open3.capture3 "aws s3 ls"
  expect(status.success?).to eq(true)
end