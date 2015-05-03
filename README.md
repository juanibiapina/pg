# pg

Wrapper script for common postgres command line operations.

# Installation

Using [basher](https://github.com/basherpm/basher):

    $ basher install juanibiapina/pg

Or clone the repository and add the `bin` folder to your path.

# Commands

- `pg list`: list databases
- `pg copy <origin> <target>`: make a copy of a database
- `pg mv <origin> <target>`: rename a database
- `pg kill-connections <database>`: kill all connections to a database
