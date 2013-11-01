Description
===========

Installs and configures 

* Hadoop 1.0.3
* Apt
* Java 1.6 Oracle
* jRuby

A simple wrapper example cookbook for **single_node_hadoop_claster** (https://github.com/MitinPavel/single_node_hadoop_claster).

The wrapper cookbook was created and tested under Vagrant + Chef-solo + Berkshelf environment. See appropriate sections below.

Requirements
============

Platform
--------

* Ubuntu
 
Tested on:

* Linux precise64 3.2.0-23-generic #36-Ubuntu SMP x86_64 GNU/Linux
* Vagrant 1.2.7
* Berkshelf 2.0.10
* vagrant-berkshelf 1.3.3
* vagrant-omnibus 1.1.1

Usage
=====

* Install Berkshelf
* Install Vagrant
* Install vagrant-berkshelf (and possible vagrant-omnibus) vagrant plugin(s)
* Create a directory and init Vagrant and Berkshelf
* Change Vagrantfile and Berksfile according to snippets below
* Copy single_node_hadoop_claster_wrapper and single_node_hadoop_claster_wrapper to cookbooks/ subdirectory
* run `vagrant up` :)

Vagrant
=======

Minimal Vagrant config:

    # -*- mode: ruby -*-
    # vi: set ft=ruby :

    VAGRANTFILE_API_VERSION = "2"

    Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
      config.omnibus.chef_version = :latest
      config.berkshelf.enabled = true


      config.vm.box = "precise64-ruby-1.9.3-p194"
      config.vm.box_url = "https://dl.dropbox.com/u/14292474/vagrantboxes/precise64-ruby-1.9.3-p194.box"

      config.vm.network :forwarded_port, guest: 50030, host: 50030
      config.vm.network :forwarded_port, guest: 50060, host: 50060
      config.vm.network :forwarded_port, guest: 50070, host: 50070
      config.vm.network :forwarded_port, guest: 50075, host: 50075

      config.ssh.forward_agent = true

      config.vm.provision :chef_solo do |chef|
        chef.add_recipe "single_node_hadoop_claster_wrapper"
      end
    end

Berkshelf
=========

Minimal Berkshelf config:

    site :opscode

    cookbook "apt"
    cookbook "java", "1.14.0"
    cookbook "rbenv"

    cookbook "single_node_hadoop_claster_wrapper", path: "cookbooks/single_node_hadoop_claster_wrapper"
    cookbook "single_node_hadoop_claster", path: "cookbooks/single_node_hadoop_claster"

License and Author
==================

- Author:: Pavel Mitin (<mitin.pavel@gmail.com>)

Copyright 2013 Pavel Mitin

Licensed under the MIT License (MIT).

