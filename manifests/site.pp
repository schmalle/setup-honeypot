node flakedummy
{
    include basesetup
    include installdb

    include base
    include kippo
    include cron
    include ewsposter
    
#    include servletpot

    Class['basesetup'] ->  Class['installdb'] ->  Class['base'] ->  Class['kippo'] ->  Class['ewsposter']


		cron::job{
  		'mysqlbackup':
    	minute      => '*/5',
    	hour        => '*',
    	date        => '*',
    	month       => '*',
    	weekday     => '*',
    	user        => 'root',
    	command     => '/usr/bin/python /opt/ewsposter/ews.py',
    	environment => ['PATH="/usr/bin:/bin"' ];
		}

}

node default
{
    include ewsposter
}