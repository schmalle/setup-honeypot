node flakedummy
{
    include basesetup
    include installdb

    include base
    include kippo
#    include servletpot

    Class['basesetup'] ->  Class['installdb'] ->  Class['base'] ->  Class['kippo'] ->  Class['ewsposter']

}

node default
{
    include ewsposter

}