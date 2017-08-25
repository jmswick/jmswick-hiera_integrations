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
  $cron      = {},
  $exec      = {},
  $file      = {},
  $group     = {},
  $host      = {},
  $mount     = {},
  $notifies  = {},
  $resources = {},
  $service   = {},
  $sshkey    = {},
  $user      = {},
){

  validate_hash($cron)
  unless empty($cron) {
    create_resources(cron, $cron)
  }

  validate_hash($exec)
  unless empty($exec) {
    create_resources(exec, $exec)
  }

  validate_hash($file)
  unless empty($file) {
    create_resources(file, $file)
  }

  validate_hash($group)
  unless empty($group) {
    create_resources(group, $group)
  }

  validate_hash($host)
  unless empty($host) {
    create_resources(host, $host)
  }

  validate_hash($mount)
  unless empty($mount) {
    create_resources(mount, $mount)
  }

  validate_hash($notifies)
  unless empty($notifies) {
    create_resources(notify, $notifies)
  }

  validate_hash($resources)
  unless empty($resources) {
    create_resources(resources, $resources)
  }

  validate_hash($service)
  unless empty($service) {
    create_resources(service, $service)
  }

  validate_hash($sshkey)
  unless empty($sshkey) {
    create_resources(sshkey, $sshkey)
  }

  validate_hash($user)
  unless empty($user) {
    create_resources(user, $user)
  }

}
