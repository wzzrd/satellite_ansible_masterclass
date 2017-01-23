#!/bin/bash

# Obviously, any names of content views, hostgroups, lifecycle environments,
# realms and ids of objects need to be changed here.

# The image used for this demo is the qemu-img that's available for download
# from the Red Hat customer portal, but has cloud-init disabled in order to speed
# up boot.

if [ -z "${1}" ]; then
  echo "Please provide system name as the single parameter."
  exit 1
fi

hammer host create --architecture-id 1  \
                   --compute-resource "Libvirt on DemoSys"  \
                   --compute-profile-id 1 \
                   --content-view CCV_RHEL7_RHSCL  \
                  --domain-id 1 \
                  --environment-id 3 \
                  --hostgroup-title RHEL7-Dev/Apache  \
                  --image "RHEL7 Guest Image 20160302"  \
                  --lifecycle-environment Dev  \
                  --location REDHATLAB  \
                  --name "${1}"  \
                  --owner "mburgerh"  \
                  --provision-method "image"  \
                  --puppet-ca-proxy-id 1  \
                  --puppet-proxy-id 1  \
                  --realm REDHAT.LAB  \
                  --subnet public \
                  --operatingsystem-id 2 \
                  --partition-table-id 61 \
                  --organization Red_Hat \
                  --interface "primary=true,type=interface,subnet_id=2,domain_id=1,identifier=eth0,managed=true,provision=true,virtual=false,compute_model=virtio,compute_network=external,compute_type=network" \
                  --compute-attributes "start=1"

