# Set up a development box super fast

## Installation

* Install vagrant using the installation instructions in the [Getting Started document](http://vagrantup.com/v1/docs/getting-started/index.html)
* Clone this repository: ```git clone --recursive git://github.com/K-Phoen/php-dev-box.git```
* After running ```vagrant up``` the box is set up using Puppet

## Installed components

For PHP projects:

* [Apache](http://httpd.apache.org/) using [puppetlabs-apache](https://github.com/puppetlabs/puppetlabs-apache) module
* [MySQL](http://dev.mysql.com/downloads/mysql/) using [puppetlabs-mysql](https://github.com/puppetlabs/puppetlabs-mysql)
* [PostgreSQL](http://www.postgresql.org/) using [puppetlabs-postgresql](https://github.com/puppetlabs/puppet-postgresql)
* [php 5.4](http://php.net) using [dotdeb](http://www.dotdeb.org)
* [capifony](http://capifony.org/)
* and more (git, zsh, vim, etc.)

For nodejs projects:

* [nodejs](http://nodejs.org/) using [puppet-nodejs](https://github.com/willdurand/puppet-nodejs)
* npm


## Using the box

The Apache web server is accessible through 127.0.0.1:8080.
The recipes are split so that this setup can be easily used for different
projects and different users. Just edit the `puppet/manifests/project.pp`
and `puppet/manifests/user.pp` to fit your needs.

Don't forget to edit project specific information in the
`puppet/manifests/params.pp` file (database type, database credentials, apache
virtualhost).
