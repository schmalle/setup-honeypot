class kippo
{
	
    package { 'authbind':
      ensure => present,
    }

    package { 'python-twisted':
      ensure => present,
    }
    
    package { 'python-mysqldb':
     ensure => present,
    }


    exec { "Kippo-Checkout":
        path => "/bin:/usr/bin",
        command => "su -c 'svn checkout http://kippo.googlecode.com/svn/trunk/ /data/honeypot/kippo-read-only' honeypot",
    }

    exec { "Install Kippo-DB":
        path => "/bin:/usr/bin",
        command => "mysql kippo -u root < /data/honeypot/kippo-read-only/doc/sql/mysql.sql",

 # 			subscribe => File["/data/honeypot/kippo-read-only/kippo.cfg"],
 # 			refreshonly => true  
 
    }


        exec { "Authbind":
            path => "/bin:/usr/bin",
            command => "/bin/sh /data/honeypot/kippo.sh"
        }


  file { '/data/honeypot/kippo-read-only/kippo.cfg':
    source => "puppet://$puppetMaster/honeypot_data/kippo.cfg.dist"
  }

  file { '/data/honeypot/kippo-read-only/start.sh':
    source => "puppet://$puppetMaster/honeypot_data/start.sh"
  }

  file { '/data/honeypot/kippo.sh':
    source => "puppet://$puppetMaster/honeypot_data/kippo.sh"
  }

    Exec['Kippo-Checkout'] -> Exec['Install Kippo-DB'] -> File['/data/honeypot/kippo-read-only/kippo.cfg'] -> File['/data/honeypot/kippo-read-only/start.sh'] -> Package['authbind'] -> File['/data/honeypot/kippo.sh'] -> Exec['Authbind'] -> Package['python-twisted']

}
