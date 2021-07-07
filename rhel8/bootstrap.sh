# Register VM with Red Hat Subscription Manager
subscription-manager register --username="$1" --password="$2" --auto-attach

# Get updates
dnf update -y
dnf upgrade -y

# Upgrade to 'server with gui'
dnf groupinstall "server with gui" -y
systemctl set-default graphical.target
systemctl isolate graphical.target

# Install NFS
#dnf -y install nfs-utils

# Reboot for safety
reboot
