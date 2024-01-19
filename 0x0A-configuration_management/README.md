# Configuration Management Project

This project involves creating several Puppet manifests to perform various tasks such as creating a file, installing a package, and executing a command.

## Features

* Creates a file at `/tmp/school` with specified content, owner, group, and permissions.
* Installs a specific version of Flask using pip3.
* Kills a process named `killmenow` using the `pkill` command.

## Usage

1. To create a file at `/tmp/school`, apply the `0-create_a_file.pp` manifest using the command:

  ```bash
  puppet apply 0-create_a_file.pp
  ```

2. To install Flask version 2.1.0, apply the `1-install_a_package.pp` manifest using the command:

  ```bash
  puppet apply 1-install_a_package.pp
  ```

3. To kill the `killmenow` process, apply the `2-execute_a_command.pp` manifest and then manually refresh the `exec` resource using the commands:

  ```bash
  puppet apply 2-execute_a_command.pp
  puppet resource exec killmenow
  ```

## Authors and Acknowledgment

This project is developed by Shecktar. Special thanks to the alx community for the extensive knowledge and support.

## License

This project is licensed under the terms of the MIT license.

