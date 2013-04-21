class basesetup
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

  File['/data/'] -> File['/data/honeypot/'] -> File['/data/honeypot/config/'] -> File['/data/honeypot/readme.txt'] -> File['/data/honeypot/logfile1'] -> File['/data/honeypot/logfile2'] -> File['/data/honeypot/logfile3']

}