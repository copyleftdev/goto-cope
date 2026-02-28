# -*- mode: ruby -*-
# vi: set ft=ruby :
# =============================================================
# AIDENY — Vagrantfile
# A full virtual machine for a 190-line COBOL program
# =============================================================
# This provisions an Ubuntu VM, installs GnuCOBOL, compiles
# the denial engine, and runs it. Because sometimes Docker
# isn't enough overkill and you need an entire OS.
# =============================================================

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.hostname = "denial-engine"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "AIDENY Denial Engine"
    vb.memory = "512"
    vb.cpus = 1
    # 512MB and 1 CPU is more than enough for denial.
    # The argument runs fine on zero resources.
  end

  config.vm.synced_folder ".", "/home/vagrant/aideny"

  config.vm.provision "shell", inline: <<-SHELL
    echo "============================================"
    echo "  Provisioning denial engine environment..."
    echo "============================================"

    apt-get update -qq
    apt-get install -y -qq gnucobol > /dev/null 2>&1

    echo "Compiling denial engine..."
    cd /home/vagrant/aideny
    cobc -x -o aideny AIDENY.cbl

    echo "============================================"
    echo "  Denial engine ready."
    echo "  Run: cd /home/vagrant/aideny && ./aideny"
    echo "============================================"
  SHELL
end
