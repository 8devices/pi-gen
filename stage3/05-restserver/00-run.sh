#!/bin/bash -e

install -d ${ROOTFS_DIR}/usr/local/lib/ ${ROOTFS_DIR}/usr/local/sbin/

install -m 644 files/restserver.service ${ROOTFS_DIR}/etc/systemd/system/

