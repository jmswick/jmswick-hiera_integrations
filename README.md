# hiera_integrations

#### Table of Contents

1. [Description](#description)
1. [Usage](#usage)
    * [Getting Started](#getting-started)
    * [Supported Resource](#supported-resources)
    * [Usage Example](#usage-example)
1. [Reference](#reference)
1. [Limitations](#limitations)
1. [Development](#development)

## Description

This is a highly opinionated module to enable the direct interation with some
of the core Puppet built-in resources from Hiera without the need to write up
a full puppet manifest.  This is not intended to ever replace fully fledged
modules, but is intended to serve an altertative to role/profile modules when
coupled with a robust Hiera hierarchy.

This is best utilized in an environment with a robust naming standard that can
be easily parsed into facts that declare the role of a particular node, but
that standard and parsing is out of scope for this module.

## Usage

### Getting Started

To get started with hiera_integrations, in your common.yaml (or equivelant)
include the class in your classes array.

Example:
```
classes:
  - hiera_integrations
```

If you are using Hiera 5, adding the following lookup_option hash aids in
removing a resource at a higher level if it is not needed:

```
lookup_options:
  '^hiera_integrations::(.*)$':
    merge:
      strategy: deep
      knockout_prefix: --
```

### Supported Resources

Utilizing the module is relatively simple, as all it takes to create a resource
is to add a hash in hiera for the resource you wish to create.

These are the resources that are currently supported by the module:

  * cron
  * file
  * host
  * mount
  * notifies (See note below)
  * resources
  * service
  * user

Note: The "notify" resource is accessed via the "notifies" hash, this was due
to a conflict with the "notify" ordering metaparameter.

### Usage Example

Here is an example of creating a few resources from hiera hashes.  This removes
the default Apache index on a host that is just serving up arbitrary files, adds
the public key for a host into the system known hosts file, and then ensures
that only Puppet managed SSH keys are in root's authorized keys file.

```
hiera_integrations::file:
  apache_index:
    path: '/var/www/html/index.html'
    ensure: absent
    require: Class[Apache]
hiera_integrations::sshkey:
  somehost.my.domain:
    host_aliases:
      - somehost
      - 10.10.20.30
    key: AAA....=
    type: ssh-rsa
    target: /etc/ssh/ssh_known_hosts
hiera_integrations::user:
  root:
    home: '/root'
    purge_ssh_keys: true
```

## Reference

Since this is just a create_resources wrapper around Puppet built in resources,
please refer to the official Puppet documentation on them.  All the attributes
are usable, in addition to ordering.

https://docs.puppet.com/puppet/4.10/type.html

## Limitations

Each supported resource requires its own parameter in the module, so I haven't
gone out of my way to add all of them, just the ones I've had cause to use
for a one-off of some form or another.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel
are necessary or important to include here. Please use the `## ` header.
