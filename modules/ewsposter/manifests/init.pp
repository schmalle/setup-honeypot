#
# install Early warning system importer / poster
# Puppet code by Markus Schmall
# EWS Poster code by Markus Schroer
#


class ewsposter
{

  file {'/opt':
      ensure => "directory",
      mode   => 644,
    }

  file {'/opt/ewsposter':
      ensure => "directory",
      mode   => 777,
      owner => "root",
  		group => "root",
    }

  file {'/opt/ewsposter/spool':
      ensure => "directory",
      mode   => 777,
      owner => "root",
  		group => "root",
    }



    package { 'python-mysqldb':
        ensure => present,
    }

    package { 'python-requests':
        ensure => present,
    }

    package { 'python-simplejson':
        ensure => present,
    }

    package { 'python-argparse':
        ensure => present,
    }

    package { 'python-lxml':
        ensure => present,
    }

    file { '/opt/ewsposter/ews.py':
        ensure => present,
	      owner => "root",
  			group => "root",
        source => "puppet://$puppetMaster/honeypot_data/ews.py"
    }

    file { '/opt/ewsposter/ews.cfg':
        ensure => present,
	      owner => "root",
	  		group => "root",
        source => "puppet://$puppetMaster/honeypot_config/ews.cfg"
    }

    file { '/opt/type.conf':
        ensure => present,
        owner => "root",
    		group => "root",
        source => "puppet://$puppetMaster/honeypot_config/type.conf"
    }

	
		File['/opt/'] -> File['/opt/ewsposter']-> File['/opt/ewsposter/spool'] -> File ['/opt/ewsposter/ews.py'] -> File ['/opt/ewsposter/ews.cfg'] -> File['/opt/type.conf'] 


}