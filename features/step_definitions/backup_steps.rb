require 'Open3'

When(/^I Install pip$/) do
  command = "ansible-playbook backup.playbook.yml --tags=install_pip"
  _,_, @status  = Open3.capture3 "#{command}"
end

Then(/^pip should be working well$/) do
    _,_, status  = Open3.capture3 " pip --help "
    expect(status.success?).to eq(true)
end

When(/^I Install Boto sdk$/) do
  command = "ansible-playbook backup.playbook.yml --tags=install_boto"
  _,_, @status  = Open3.capture3 "#{command}"
end

When(/^I create Amazon s(\d+) bucket$/) do |arg1|
  command = "ansible-playbook backup.playbook.yml --tags=create_s3_bucket"
  _,_, @status  = Open3.capture3 "#{command}"
end

When(/^I build the Backup Script$/) do
  command = "ansible-playbook backup.playbook.yml --tags=build_script"
  _,_, @status  = Open3.capture3 "#{command}"
end

When(/^I add the cron Job$/) do
  command = "ansible-playbook backup.playbook.yml --tags=cron_job"
  _,_, @status  = Open3.capture3 "#{command}"
end