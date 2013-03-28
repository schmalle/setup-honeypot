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



