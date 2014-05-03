Vagrant.configure("2") do |config|
  config.vm.box = "centos65"
  config.vm.provision :docker do |d|
    d.pull_images "busybox"
  end
  config.vm.provision :shell, :inline => <<-PREPARE
yum -y update
yum install -y wget unzip curl

mkdir /home/vagrant/packer
cd /home/vagrant/packer
wget https://dl.bintray.com/mitchellh/packer/0.5.2_linux_amd64.zip
unzip 0.5.2_linux_amd64.zip
echo "export PATH=$PATH:/home/vagrant/packer" > /home/vagrant/.bashrc
git clone git@github.com:kazuph/packer-docker.git

cd /home/vagrant
wget https://raw.githubusercontent.com/kazuph/dotfiles/master/_gitconfig
mv _gitconfig .gitconfig
PREPARE

end
