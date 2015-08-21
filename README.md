# Developed using

* OS Yosemite 10.10.4
* Brackets 1.4
* Google Chrome 44 (64-bit)
* Vagrant 1.6.5

# How to run the application


1. From your host:

        $ mkdir pusher
        $ cd pusher
        $ curl -O https://bitbucket.org/chachan/pusher/raw/HEAD/Vagrantfile
        $ vagrant up --provider virtualbox
        $ vagrant ssh

2. From your guest:

        $ cd /vagrant
        $ wget https://bitbucket.org/chachan/pusher/get/HEAD.zip
        $ unzip HEAD.zip
        $ mv -f chachan-pusher-*/.* chachan-pusher-*/* .
        $ rmdir chachan-pusher-*
        $ rm HEAD.zip
        $ sudo sh install.sh
        $ sh start.sh

3. Visit http://localhost:8080/messages/

4. To create notifications execute: `sh /vagrant/post-message.sh --message "Hello World" --level "Moon"`