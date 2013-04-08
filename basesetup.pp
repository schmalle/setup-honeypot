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
    source => 'puppet://flakedev.no-ip.org/honeypot/readme.txt'
  }




  File['/data/'] -> File['/data/honeypot/'] -> File['/data/honeypot/config/'] -> File['/data/honeypot/readme.txt']

}