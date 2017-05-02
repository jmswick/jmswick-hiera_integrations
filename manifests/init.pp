# Class: hiera_integrations
# ===========================
#
# Full description of class hiera_integrations here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'hiera_integrations':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class hiera_integrations (
  $cron    = {},
  $file    = {},
  $host    = {},
  $mount   = {},
  $notify  = {},
  $service = {},
  $user    = {},
){

  validate_hash($cron)
  if $cron {
    create_resources(cron, $cron)
  }

  validate_hash($file)
  if $file {
    create_resources(file, $file)
  }

  validate_hash($host)
  if $host {
    create_resources(host, $host)
  }

  validate_hash($mount)
  if $mount {
    create_resources(mount, $mount)
  }

  validate_hash($notify)
  if $notify {
    create_resources(notify, $notify)
  }

  validate_hash($resources)
  if $resources {
    create_resources(resources, $resources)
  }

  validate_hash($service)
  if $service {
    create_resources(service, $service)
  }

  validate_hash($user)
  if $user {
    create_resources(user, $user)
  }

}
