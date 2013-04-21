 class base
 {

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
    source => "puppet://$puppetMaster/honeypot_data/sshd_config"
  }

  file { '/data/honeypot/handleservletpot.sh':
    source => "puppet://$puppetMaster/honeypot_data/handleservletpot.sh"
  }


  file { '/data/honeypot/handlepuppetcron.sh':
    source => "puppet://$puppetMaster/honeypot_data/handlepuppetcron.sh"
  }


  file { '/etc/tomcat7/context.xml':
    source => "puppet://$puppetMaster/honeypot_data/tomcat_context.xml"
  }


    Package['openssh-server'] -> File['/etc/ssh/sshd_config']
    Package['tomcat7'] -> File['/etc/tomcat7/context.xml']

}