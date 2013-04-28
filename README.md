setup-honeypot
==============

Scripts / docs to setup a plain linux (ubuntu) box with a number of honeypots.

Usage: 

copy all files to /usr/share/puppet
copy ./manifests/site.ppt to /etc/puppet/manifests/site.pp 

Included honeypots:

Kippo
Servletpot

Important information:

SSH Port ist moved to 60022

Start kippo with "su honeypot -c ./start.sh"
