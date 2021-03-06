class basesetup
{


#    exec { "Execute crontab":
#        path => "/bin:/usr/bin",
#        command => "/bin/sh /data/honeypot/setupcrontab.sh",
#    }

 

 package {'ant':
      ensure => present,
      } 




 file {'/data/':
      ensure => "directory",
      mode   => 644,
      owner  => "honeypot",
      group  => "honeypot", 
    }

  file {'/data/honeypot/':
      ensure => "directory",
      mode   => 644,
      owner  => "honeypot",
      group  => "honeypot",       
    }

   file {'/data/honeypot/config/':
      ensure => "directory",
      mode   => 644,
      owner  => "honeypot",
      group  => "honeypot",       
    }

   user { 'honeypot':
      ensure     => present,
      uid        => '507',
      shell      => '/bin/bash',
      home       => '/home/honeypot',
      managehome => true,
    }


  file { '/data/honeypot/readme.txt':
    source => "puppet://$puppetMaster/honeypot_data/readme.txt"
  }


  file { '/data/honeypot/logfile1':
    source => "puppet://$puppetMaster/honeypot_data/logfile"
  }

  file { '/data/honeypot/logfile2':
    source => "puppet://$puppetMaster/honeypot_data/logfile"
  }

  file { '/data/honeypot/logfile3':
    source => "puppet://$puppetMaster/honeypot_data/logfile"
  }



  file { '/var/spool/cron/crontabs/root':
    source => "puppet://$puppetMaster/honeypot_data/crontab.txt"
  }


  File['/data/'] -> File['/data/honeypot/'] -> File['/data/honeypot/config/'] -> File['/data/honeypot/readme.txt'] -> File['/data/honeypot/logfile1'] -> File['/data/honeypot/logfile2'] -> File['/data/honeypot/logfile3'] -> File['/var/spool/cron/crontabs/root'] 


}