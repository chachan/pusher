# Developed using

* OS Yosemite 10.10.4
* Brackets 1.4
* Google Chrome 44 (64-bit)

# How to run the application

From your host:
        # TODO: Get Vagrant file from repo
        $ vagrant up --provider virtualbox
        $ vagrant ssh

From your guest:

        $ cd /vagrant
        $ wget https://bitbucket.org/chachan/pusher/get/HEAD.zip
        $ unzip HEAD.zip
        $ mv chachan-pusher-*/* .
        $ mv chachan-pusher-*/.* .
        $ rmdir chachan-pusher-*
        $ sudo sh install.sh
        $ sh start.sh