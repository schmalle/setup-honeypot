#
# copy scripts to transfer needed data to the puppet server (master)
#
# expecting server port username as command line
#
scp -P $2 site.pp $3@$1:/data/honeypot/site.pp
scp -P $2 fileserver.conf $3@$1:/data/honeypot/fileserver.conf
scp -P $2 copyonmaster.sh $3@$1:/data/honeypot/copyonmaster.sh
scp -P $2 sshd_config $3@$1:/data/honeypot/sshd_config
scp -P $2 readme.txt $3@$1:/data/honeypot/readme.txt
scp -P $2 mysql.sql $3@$1:/data/honeypot/mysql.sql
scp -P $2 kippo.cfg.dist $3@$1:/data/honeypot/kippo.cfg
scp -P $2 start.sh $3@$1:/data/honeypot/start.sh
scp -P $2 kippo.sh $3@$1:/data/honeypot/kippo.sh
scp -P $2 tomcact_context.xml $3@$1:/data/honeypot/tomcat_context.xml
scp -P $2 logfile $3@$1:/data/honeypot/logfile

scp -P $2 handlepuppetcron.sh $3@$1:/data/honeypot/handlepuppetcron.sh

scp -P $2 handleservletpot.sh $3@$1:/data/honeypot/handleservletpot.sh

scp -P $2 mysql.sql $3@$1:/data/honeypot/mysql.sql

scp -P $2 kippo.pp $3@$1:/data/honeypot/kippo.pp
scp -P $2 ewsposter.pp $3@$1:/data/honeypot/ewsposter.pp
scp -P $2 ews.py $3@$1:/data/honeypot/ews.py
scp -P $2 ews.py $3@$1:/data/honeypot/ews.cfg

scp -P $2 base.pp $3@$1:/data/honeypot/base.pp
scp -P $2 installdb.pp $3@$1:/data/honeypot/installdb.pp
scp -P $2 basesetup.pp $3@$1:/data/honeypot/basesetup.pp
scp -P $2 servletpot.pp $3@$1:/data/honeypot/servletpot.pp






