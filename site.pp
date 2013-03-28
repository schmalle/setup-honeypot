node default 
{

 file {'/data/':
      ensure => "directory",
      mode   => 644,
    }
 
  file {'/data/honeypot/':
      ensure => "directory",
      mode   => 644,
    }
 
   file {'/data/honeypot/config/':
      ensure => "directory",
      mode   => 644,
    }
 
   user { 'honeypot':
      ensure     => present,
      uid        => '507',
      shell      => '/bin/bash',
      home       => '/home/honeypot',
      managehome => true,
    }
 
 
  file { '/data/honeypot/readme.txt':
    source => 'puppet://flakedev.no-ip.org/honeypot/readme.txt'
  }

  file { '/etc/ssh/sshd_config':
    source => 'puppet://flakedev.no-ip.org/honeypot/sshd_config'
  }

 package { 'openssh-server':
      ensure => present,
 }

 package { 'authbind':
      ensure => present,
 }

 package { 'git':
      ensure => present,
 }


 package { 'subversion':
      ensure => present,
 }
 
 package { 'openjdk-7-jdk' :
      ensure => present,
      before  => package['tomcat7'],
 }

 package { 'tomcat7' :
      ensure => present,
 }

 package { 'mysql-server' :
      ensure => present,
 }


exec { "Kippo-Checkout":
    path => "/bin:/usr/bin",
    command => "svn checkout http://kippo.googlecode.com/svn/trunk/ /data/honeypot/kippo-read-only",
}


exec { "ServletPot-Checkout":
    path => "/bin:/usr/bin",
    command => "git clone https://github.com/schmalle/Servletpot.git /data/honeypot/Servletpot",
}

exec { "Install Servletpot-DB":
    path => "/bin:/usr/bin",
    command => "mysql -u root < /data/honeypot/Servletpot/installmysql.sql",
}

exec { "Install Kippo-DB":
    path => "/bin:/usr/bin",
    command => "mysql kippo -u root < /data/honeypot/kippo-read-only/doc/sql/mysql.sql"
}

exec { "Install DB":
    path => "/bin:/usr/bin",
    command => "mysql -u root < /data/honeypot/mysql.sql"
}

exec { Remove Servletpot":
    path => "/bin:/usr/bin",
    command => "rm -rf * /data/honeypot/Servletpot/"
}

exec { "Remove Kippo":
    path => "/bin:/usr/bin",
    command => "rm -rf * /data/honeypot/kippo-read-only/"
}




	Exec['Remove Servletpot'] -> Exec['Remove Kippo'] -> Package['subversion'] -> Package['git'] -> Package['mysql-server'] -> Exec["Kippo-Checkout"] -> Exec["ServletPot-Checkout"] -> Exec['Install Servletpot-DB'] -> exec ['Install DB'] -> Exec['Install Kippo-DB']  
	File['/data/'] -> File['/data/honeypot/'] -> File['/data/honeypot/config/'] -> File['/data/honeypot/readme.txt']
     
}