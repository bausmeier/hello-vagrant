# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "lucid32"
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "apt"
    chef.add_recipe "build-essential"
    chef.add_recipe "ohai"
    chef.add_recipe "nginx"
    chef.add_recipe "node-app"
  end
  config.vm.forward_port 80, 8001
end
