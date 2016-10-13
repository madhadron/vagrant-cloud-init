# Vagrant with cloud-init, DNS, and multiple hosts

This is an example showing Vagrant bringing up two CentOS 7 hosts with
DNS support and initial configuration via cloud-init. It is a useful
template for setting up local development and testing environments for
multi-machine clusters that will be deployed later in a cloud.

You must have the latest version of Vagrant and VirtualBox installed.

To start the cluster, run:

    make up

To destroy the cluster and clean up, run

    make clean

The usual workflow if you are editing the user-data script for
cloud-init is to run

    make clean up

each time you want to try a change.

## Requirements

To use this example, you will need the latest versions of Vagrant and
VirtualBox running on MacOS X or Linux.

If you need to port to another system, you have to add a conditional
to for it to the section of the Makefile where it called hdiutil (on
MacOS X) or genisoimage (on Linux) to create an ISO9660 filesystem
containing the cloud-init configuration.

## License

This code is released under the MIT License. See the LICENSE file in
the repository.