#!/usr/bin/env bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${USER_ID:-9001}
USER=${USER_NAME:-biggis}

# Set the timezone. Base image does not contain the setup-timezone script, so an alternate way is used.
if [ -n "$TIMEZONE" ]; then
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
	echo "${TIMEZONE}" >  /etc/timezone && \
	echo "Container timezone set to: $TIMEZONE"
else
	echo "Container timezone not modified"
fi

echo "Starting with UID : $USER_ID"
addgroup -S -g $USER_ID $USER
adduser -h /home/$USER -u $USER_ID -s /bin/bash -G $USER -S $USER
chown -R $USER:$USER /home/$USER /opt /tmp /data /etc
export HOME=/home/$USER

exec gosu $USER "$@"
