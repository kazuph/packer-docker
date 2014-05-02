#!/bin/bash -eu
[ -z "`vagrant status | grep running`" ] && vagrant up
vagrant ssh -- cat .ssh/authorized_keys > authorized_keys
[ `cat authorized_keys | wc -l` == 2 ] && exit 1
ssh-keygen -y -f $HOME/.ssh/id_rsa >> authorized_keys
vagrant ssh-config > ssh_config
scp -F ssh_config authorized_keys default:.ssh/authorized_keys
cat <<_EOF_

構築DONE!

------------------------------
$ cat $HOME/.ssh/config
Host vagrant
  HostName 127.0.0.1
  User vagrant
  Port 2222 # ※Port番号は適宜変更の必要あり

$ ssh vagrant
------------------------------

_EOF_
