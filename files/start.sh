#!/bin/sh

echo -n "Starting kippo in background..."
authbind --deep twistd -y kippo.tac -l log/kippo.log --pidfile kippo.pid

