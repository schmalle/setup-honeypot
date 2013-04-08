class installdb {

    package { 'mysql-server' :
       ensure => present,
    }

    file { '/data/honeypot/mysql.sql':
       source => 'puppet://flakedev.no-ip.org/honeypot/mysql.sql'
    }

    exec { "Install DB":
        path => "/bin:/usr/bin",
        command => "mysql -u root < /data/honeypot/mysql.sql"
    }

    Package['mysql-server'] -> File['/data/honeypot/mysql.sql'] -> Exec['Install DB']

}