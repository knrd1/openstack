#!/bin/bash
while ! timeout 0.5 ping -c 1 -n 8.8.8.8 &> /dev/null
do
    sleep 1
done

curl -L https://bootstrap.saltstack.com -o /tmp/bootstrap_salt.sh
sh /tmp/bootstrap_salt.sh
systemctl stop salt-minion && systemctl disable salt-minion
apt-get install git-all -y
git clone https://github.com/knrd1/salt.git /srv/salt
echo "file_client: local" >> /etc/salt/minion
salt-call --local state.apply
