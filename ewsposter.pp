#
# install Early warning system importer / poster
# Puppet code by Markus Schmall
# Poster by Markus Schroer
#


class ewsposter
{

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

    file { '/data/honeypot/ews.py':
        ensure => present,
        source => 'puppet://flakedev.no-ip.org/honeypot/ews.py'
    }

    file { '/data/honeypot/ews.cfg':
        ensure => present,
        source => 'puppet://flakedev.no-ip.org/honeypot_config/ews.cfg'
    }


}