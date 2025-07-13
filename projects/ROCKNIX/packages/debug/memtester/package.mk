# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="memtester"
PKG_VERSION="4.7.1"
PKG_LICENSE="GPL"
PKG_SITE="https://pyropus.ca/software/memtester/"
PKG_URL="https://pyropus.ca./software/memtester/old-versions/memtester-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A userspace utility for testing the memory subsystem for faults."
PKG_TOOLCHAIN="manual"

make_target() {
  make memtester
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  cp memtester ${INSTALL}/usr/bin
}
