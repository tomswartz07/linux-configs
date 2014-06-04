# pacman

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with pacman](#setup)
    * [What pacman affects](#what-pacman-affects)
    * [Beginning with pacman](#beginning-with-pacman)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Puppet module to configure and control PacMan package manager for ArchLinux.
This module will ensure that the appropriate .conf file is installed.

## Module Description

If applicable, this section should have a brief description of the technology
the module integrates with and what that integration enables. This section
should answer the questions: "What does this module *do*?" and "Why would I use
it?"

If your module has a range of functionality (installation, configuration,
management, etc.) this is the time to mention it.

## Setup

### What pacman affects

* Affects `/etc/pacman.conf` and controls the `pacman` package.
* Only works for ArchLinux.

### Beginning with pacman

## Usage

Currently:
```puppet
class { 'pacman' :
  iLoveCandy => true, # Optional
}
```

## Reference
```
   [*iLoveCandy*]
   Inserts 'easter egg' configuration option into pacman.conf
   Changes the standard [###--] progress bar with [---C o o ]
   styled after the 1980's 'Pacman' game.
```
## Limitations

Pacman only functions on ArchLinux or ArchLinux derivatives.

## Development

Pull requests are welcome.
