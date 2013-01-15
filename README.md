# Set up a PHP development box super fast

## Installation

* Install vagrant using the installation instructions in the [Getting Started document](http://vagrantup.com/v1/docs/getting-started/index.html)
* Clone this repository: ```git clone git://github.com/K-Phoen/php-dev-box.git --recursive```
* After running ```vagrant up``` the box is set up using Puppet

## Installed components

* [Apache](http://httpd.apache.org/) using [puppetlabs-apache](https://github.com/puppetlabs/puppetlabs-apache) module
* [php](http://php.net) using
* [saz/puppet-php](https://github.com/saz/puppet-php) and [dotdeb](http://www.dotdeb.org)
* [MySQL](http://dev.mysql.com/downloads/mysql/) using [puppetlabs-mysql](https://github.com/puppetlabs/puppetlabs-mysql)
* [capifony](http://capifony.org/)
* and more (git, zsh, vim, etc.)

## Using the box

The apache web server is accessible through 127.0.0.1:8080.
The recipes are split so that this setup can be easily used for différent
projects and different users. Just edit the `puppet/manifests/project.pp`
and `puppet/manifests/user.pp` to fit your needs.

Don't forget to edit project specific information in the
`puppet/manifests/params.pp` file (mysql credentials, apache virtualhost).