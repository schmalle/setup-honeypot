#
# silly script to checkout puppet-cron only, if not existing yet
#


if [ -f /usr/share/puppet/modules/cron/Rakefile ];
then
cd /usr/share/puppet/modules/cron/; git pull
else
git clone https://github.com/torrancew/puppet-cron.git /usr/share/puppet/modules/cron
fi








