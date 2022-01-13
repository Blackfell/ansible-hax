# generic/arch doesn't play well with VMWARE resolver I have, so have to do some post-install. Sorry.
$script=<<-SCRIPT
sudo cp /etc/systemd/resolved.conf /etc/systemd/resolved.conf.bak
sed -e "s/^DNSSEC\=yes$/DNSSEC\=yes\\/supported/ig" /etc/systemd/resolved.conf | sudo tee /etc/systemd/resolved.conf
sudo systemctl restart systemd-resolved
sleep 2
sudo pacman -Syyu --noconfirm && sudo pacman -S python3 --noconfirm
SCRIPT

# vagrant init generic/arch
Vagrant.configure("2") do |config|
  config.vm.box = "generic/arch"
  config.vm.provider "vmware_workstation" do |v|
    #v.linked_clone = true
    v.linked_clone = false
    v.gui = true
  end
  config.vm.provision "shell", inline: $script
  config.vm.provision "ansible" do |ansible|
    # Disable default limit to connect to all the machines
    # ansible.limit = "all"
    ansible.playbook = "vagrant.yml"
  end
end
