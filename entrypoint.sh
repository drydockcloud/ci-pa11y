#!/bin/bash -e

# To avoid file permission conflicts change the "node" user to the UID of
# the owner of the working directory and run the command as the "node" user.
usermod -o -u $(stat -c '%u' .) -s /bin/bash -d /home/node/app node

# To ensure the node path is maintained and quoting arbitrary strings,
# run the user command via a temporary script.
echo "#!/bin/bash -e" > /tmp/user-entrypoint.sh
echo "PATH=${PATH}" >> /tmp/user-entrypoint.sh
echo "$@" >> /tmp/user-entrypoint.sh
chmod a+x /tmp/user-entrypoint.sh
dumb-init -- su -c"/tmp/user-entrypoint.sh" node
