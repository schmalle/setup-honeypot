class kippo
{

    package { 'authbind':
      ensure => present,
    }

    package { 'python-twisted':
      ensure => present,
    }


    exec { "Kippo-Checkout":
        path => "/bin:/usr/bin",
        command => "svn checkout http://kippo.googlecode.com/svn/trunk/ /data/honeypot/kippo-read-only",
    }

    exec { "Install Kippo-DB":
        path => "/bin:/usr/bin",
        command => "mysql kippo -u root < /data/honeypot/kippo-read-only/doc/sql/mysql.sql"
    }


        exec { "Authbind":
            path => "/bin:/usr/bin",
            command => "/bin/sh /data/honeypot/kippo.sh"
        }


  file { '/data/honeypot/kippo-read-only/kippo.cfg':
    source => 'puppet://flakedev.no-ip.org/honeypot/kippo.cfg'
  }

  file { '/data/honeypot/kippo-read-only/start.sh':
    source => 'puppet://flakedev.no-ip.org/honeypot/start.sh'
  }

  file { '/data/honeypot/kippo.sh':
    source => 'puppet://flakedev.no-ip.org/honeypot/kippo.sh'
  }

    Exec['Kippo-Checkout'] -> Exec['Install Kippo-DB'] -> File['/data/honeypot/kippo-read-only/kippo.cfg'] -> File['/data/honeypot/kippo-read-only/start.sh']

    Package['authbind'] -> File['/data/honeypot/kippo.sh'] -> Exec['Authbind'] -> Package['python-twisted']

}