# DevOps Learning Outcome 10 - Backup & restore

This exercise that covers the following operations:

* Setting up recurring automatic backups of critical data (database, e.t.c) on a system.
* Setting up scripts to verify the backups to ensure it is valid and restorable.
* Setting up scripts to move the backup data to an external store (AWS S3)
* Putting together a recovery plan to restore the data in the event of data loss


## System Requirements

This exercise require you to have the following tools installed in you machine.

* Python
* Pip
* Ansible > 2.0
* AWS CLI
* Boto
* Ruby
* Cucumber
* Virtual box (to test locally)
* Aws account(s3 storage)

# Setup

First clone this repository into your workspace and `cd` into it.
```bash
$ git clone https://github.com/andela-thomas/tunza.git

```
Rename `sample.credentials.yml` to `credentials.yml`, Update the variables in this file with yours. Make sure to `inventory.ini` file to have the ip address of the vm you are provisioning and the appropriate shh key. This can be aws or any other machine.
```
# inventory.ini
[backup]
#your ip address    your ssh key
x.x.x.x.x     ansible_ssh_private_key_file=./path/to/your/private/key

```

# Provisioning
Run the following script from your terminal
```bash

$ ansible-playbook provision.yml  # this will prepare you server for installation

$ ansible-playbook backup.playbook.yml # this will configure you server to act as backup server.

```

You can modify the backup.sh.j2 in the backup role to fit your specific need.

Testing

This exercise follows the TDD practice.to run tests

```bash
$ bundle install

$ cucumber

```

Happy tinkering


Run ansible-playbook playbook.backup.yml -i prod_inventory.ini to set up automatic backup for mysql database to.
Testing locally

Setup

Run vagrant up. This will bring up a virtual machine and also provision it.
Create a file called secret_vars.yml, copying the contents of secret_vars.example.yml. Replace the values in the file with yours.
Update the variables in vars.yml file with yours. Note that host_user should be changed to vagrant and not ubuntu for testing locally.
Run tests

Run cucumber features/backup.feature to run tests and set up the virtual machine.


