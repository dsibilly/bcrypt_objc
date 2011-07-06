bcrypt_objc
===========
by Duane Sibilly <duane@sibilly.com>

An Objective-C wrapper for [Ricardo Garcia's bcrypt C library](https://github.com/rg3/bcrypt) and a test-drive of Dave Dribin's ddcli command-line application framework. Project inspired by Marco Arment's [clean-room bcrypt implementation for PHP 5.3](https://gist.github.com/1053158/).

Requirements
------------
Mac OS X 10.6.x or higher
XCode Developer Tools 4.x or higher

Feedback
--------
Feedback and suggestions are very welcome. Make use of the [Issues list](https://github.com/dsibilly/bcrypt_objc/issues) on Github to send input.

Forks are openly invited.

License Terms
-------------
The bcrypt C library is public domain, as is the content of MABcrypt.h/.m. The [ddcli command line application framework](http://www.dribin.org/dave/blog/archives/2008/04/29/ddcli/) is copyright (c) 2008 Dave Dribin and used under the MIT License. The rest of the project is likewise released under the MIT License; see [LICENSE](https://github.com/dsibilly/bcrypt_objc/blob/master/LICENSE) for details.

Building bcrypter
=================
Building this project is as simple as using GNU Make from the OS X terminal:

				make all

The Makefile builds the project into a binary executable named `bcrypter`. bcrypter takes a single argument: the plaintext password to be hashed.

				$ bcrypt TestP455w0rd.

The actual wrapper, [MABcrypt.h](https://github.com/dsibilly/bcrypt_objc/blob/master/MABcrypt.h), is meant for use in a larger password authentication system for Cocoa UI or CLI applications. Read the header for details.