# pg

Wrapper script for common postgres command line operations.

# Installation

Using [basher](https://github.com/basherpm/basher):

    $ basher install juanibiapina/pg

Or clone the repository and add the `bin` folder to your path.

# Commands

`pg list`: lists databases
`pg save <database>`: saves a snapshot of a database
`pg restore <database>`: restores a database from a snapshot
`pg kill-connections <database>`: kill all connections to a database

# Development

This is still a very initial propotype I hacked together from some of my common use cases. There are no tests, since I would probably need to bring up a postgres instance just for this. Pull requests are welcome as always.
