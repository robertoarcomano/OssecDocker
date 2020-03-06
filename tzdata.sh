# set noninteractive installation
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y tzdata

# set your timezone
ln -fs /usr/share/zoneinfo/Europe/Dublin /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata
