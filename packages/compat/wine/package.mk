# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2024-present JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="wine"
PKG_VERSION="10.3"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/Kron4ek/Wine-Builds"
# Use the amd64 release as it supports running both 32-bit and 64-bit windows apps
PKG_URL="${PKG_SITE}/releases/download/${PKG_VERSION}/wine-${PKG_VERSION}-amd64.tar.xz"
PKG_DEPENDS_TARGET="toolchain libXcomposite libXdmcp cups"
PKG_LONGDESC="Wine is a compatibility layer capable of running Windows applications"
PKG_TOOLCHAIN="manual"
PKG_WINE_TRICKS="https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks"

unpack() {
  mkdir -p ${PKG_BUILD}
  tar --strip-components=1 -xf ${SOURCES}/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.tar.xz -C ${PKG_BUILD}
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  mkdir -p ${INSTALL}/usr/lib
  mkdir -p ${INSTALL}/usr/share

  cp -rf ${PKG_BUILD}/bin/* ${INSTALL}/usr/bin
  cp -rf ${PKG_BUILD}/lib/* ${INSTALL}/usr/lib
  cp -rf ${PKG_BUILD}/share/* ${INSTALL}/usr/share

  curl -Lo ${INSTALL}/usr/bin/winetricks ${PKG_WINE_TRICKS}

  chmod +x ${INSTALL}/usr/bin/*
}
