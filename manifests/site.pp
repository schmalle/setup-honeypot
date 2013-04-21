node none
{
#    include basesetup
#    include installdb

#    include base
#    include kippo
#    include servletpot

#    Class['basesetup'] ->  Class['installdb'] ->  Class['base'] ->  Class['kippo'] ->  Class['servletpot']

}

node default
{
    include ewsposter

}