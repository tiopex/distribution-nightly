# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="SDL_sound"
PKG_VERSION="c5639414c1bb24fb4eef5861c13adb42a4aab950"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/icculus/SDL_sound"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain alsa-lib SDL2"
PKG_LONGDESC="SDL_sound library"

PKG_CMAKE_OPTS_TARGET="-DCMAKE_POLICY_VERSION_MINIMUM=3.5"

pre_configure_target() {
  export LDFLAGS="${LDFLAGS} -lm"
}

