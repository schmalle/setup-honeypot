#
# silly script to checkout Servletpot only, if not existing yet
#


if [ -f /data/honeypot/Servletpot/README.txt ];
then
  su honeypot -c 'cd /data/honeypot/Servletpot; git pull'
else
  su honeypot -c 'git clone https://github.com/schmalle/Servletpot.git /data/honeypot/Servletpot'
  su honeypot -c 'cd /data/honeypot/Servletpot; ant'
  rm -rf /var/lib/tomcat7/webapps/ROOT
  cp /data/honeypot/Servletpot/servletpot.war /var/lib/tomcat7/webapps/ROOT.war
fi

