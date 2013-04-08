 class base {

    package { 'openssh-server':

      ensure => present,
      before => File ['/etc/ssh/sshd_config'],
    }



    package { 'git':
      ensure => present,
    }


    package { 'subversion':
      ensure => present,
    }

    package { 'openjdk-7-jdk' :
       ensure => present,
       before  => Package['tomcat7'],
    }

    package { 'tomcat7' :
       ensure => present,
    }

  file { '/etc/ssh/sshd_config':
    source => 'puppet://flakedev.no-ip.org/honeypot/sshd_config'
  }

  file { '/data/honeypot/handleservletpot.sh':
    source => 'puppet://flakedev.no-ip.org/honeypot/handleservletpot.sh'
  }
}