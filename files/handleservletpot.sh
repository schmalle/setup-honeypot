#
# silly script to checkout Servletpot only, if not existing yet
#


if [ -f /data/honeypot/Servletpot/README.txt ];
then
cd /data/honeypot/Servletpot; git pull
else
git clone https://github.com/schmalle/Servletpot.git /data/honeypot/Servletpot
fi


