# puppet-deprecate #

A puppet function to log deprecations in your manifests

[![Build Status](https://travis-ci.org/deanwilson/puppet-deprecate.svg?branch=main)](https://travis-ci.org/deanwilson/puppet-deprecate)
[![Puppet Forge](https://img.shields.io/puppetforge/v/deanwilson/deprecate.svg)](https://forge.puppetlabs.com/deanwilson/deprecate)

## Introduction ##

Sometimes you need to add resources to your manifests that should only
exist for a set period of time. By adding a call to the `deprecate`
function you can either output a warning in the puppetservers log or
cause the entire run to fail.

`deprecate` takes 2 or 3 arguments. 

 * A date string, in either YYYYMMDD or YYYY-MM-DD formats
 * A free form string describing the what and why of the deprecation
 * An optional boolean to control if the run should be aborted

## Examples ##


    class deprecated_resources {

      # show a warning in puppetservers log
      deprecate('2015-01-20', 'Remove Foo at the end of the contract')

      # fail the run and show a warning clients output and puppet server logfile
      deprecate('2015-01-25', 'Remove Foo at the end of the contract', true)

    }


    # warning in the pupperserver log
    13:56:17,938 WARN  [puppet-server] Puppet Class[Json_tester]
      expired on 20150120: Remove Foo at the end of the contract

    # error on the client side when abort is set to true
    Error: Could not retrieve catalog from remote server:
    Error 400 on SERVER: Evaluation Error: 
    Error while evaluating a Function Call, 
    Class[Json_tester] expired on 20150120: Remove Foo at the end of the contract
    at modules/json_tester/manifests/init.pp:12:3 on node testy

## Installation

You can install this module from [PuppetForge](https://forge.puppet.com/):

    puppet module install deanwilson-deprecate

### License ###

Apache 2.0 - [Dean Wilson](http://www.unixdaemon.net) 
