class servletpot
{
    exec { "ServletPot-Checkout":
        path => "/bin:/usr/bin",
        command => "/bin/sh /data/honeypot/handleservletpot.sh",
    }

    exec { "Install Servletpot-DB":
        path => "/bin:/usr/bin",
        command => "mysql -u root < /data/honeypot/Servletpot/installmysql.sql",
    }


    Exec['ServletPot-Checkout'] -> Exec['Install Servletpot-DB']


}