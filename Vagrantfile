Vagrant.require_version ">= 1.7.0"

require 'yaml'

current_dir    = File.dirname(File.expand_path(__FILE__))
configs = YAML.load_file("#{current_dir}/config.yml")
vagrant_config = configs['config']

Vagrant.configure(vagrant_config['api_version']) do |config|

	config.vm.box = "bento/ubuntu-16.04"

	config.vm.network "public_network", ip: vagrant_config['pub_ip'], bridge: "en0: Wi-Fi (AirPort)"

	config.vm.synced_folder "./", "/home/vagrant"

	config.vm.provider "virtualbox" do |v|
    	v.name = "infra-java"
    	v.customize ["modifyvm", :id, "--memory", "1024"]
	end

	config.vm.provision "shell" do |s|
    	s.path = "provision/setup/setup.sh"
	end

	config.ssh.insert_key = false

	config.vm.provision "ansible_local" do |ansible|
		ansible.verbose = "vvvv"
		ansible.playbook = "provision/env-setup.yml"
		ansible.sudo = true
	end

end
