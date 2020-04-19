#!/bin/sh
set -e

mkdir -p /tmp/popper_dev
cd /tmp/popper_dev

# Install Go
wget https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.14.2.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> $HOME/.profile
source $HOME/.profile

# Check Go installation
go version

# Install Singularity
sudo apt-get update
sudo apt-get install -y build-essential libseccomp-dev pkg-config squashfs-tools cryptsetup uuid-dev libssl-dev

git clone https://github.com/sylabs/singularity.git
cd singularity
git checkout v3.5.3
./mconfig && cd ./builddir && make && sudo make install

singularity version

# Remove installation files
rm -rf /tmp/popper_dev
cd $HOME
echo "Singularity installed successfully !"
