
Bashy
================

Classes to help you generate common tasks using bash:

* creating/deleting files and directories.
* chmod
* chdir

Installation
------------

    gem install Bashy

Usage
------

    require "Bashy"
    
    cmd = Bashy_File.new { |o|
    
      o.mode 0770
      o.sudo true
      o.path "/my_secret_dir"
      
    }.create

    `#{cmd}`

Available classes:

* Bashy\_File
* Bashy\_Dir
* Bashy\_Apt

Run Tests
---------

    git clone git@github.com:da99/Bashy.git
    cd Bashy
    bundle update
    bundle exec bacon spec/main.rb

"I hate writing."
-----------------------------

If you know of existing software that makes the above redundant,
please tell me. The last thing I want to do is maintain code.

