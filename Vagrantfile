Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu"
  # config.vm.provision :docker do |d|
  #   d.pull_images "linux/chef-solo"
  # end
  config.vm.provision :shell, :inline => <<-PREPARE

# apt-get -y update
# apt-get install -y wget unzip curl
#
# mkdir /home/vagrant/packer
# cd /home/vagrant/packer
# wget https://dl.bintray.com/mitchellh/packer/0.5.2_linux_amd64.zip
# unzip 0.5.2_linux_amd64.zip
# echo "export PATH=$PATH:/home/vagrant/packer" > /home/vagrant/.bashrc
git clone git@github.com:tcnksm/packer-docker.git
PREPARE

end
