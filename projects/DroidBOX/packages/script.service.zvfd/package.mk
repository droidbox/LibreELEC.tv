################################################################################
#      This file is part of LibreELEC - https://LibreELEC.tv
#      Copyright (C) 2016-2017 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="script.service.zvfd"
PKG_VERSION="1.0.0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain kodi"
#PKG_NEED_UNPACK="$(get_pkg_directory $MEDIACENTER)"
PKG_SHORTDESC="vfd addon for Zoomtak devices"
PKG_LONGDESC="vfd addon for Zoomtak devices"
PKG_AUTORECONF="no"

PKG_IS_ADDON="no"

make_target() {
  : #
}

makeinstall_target() {

mkdir -p $INSTALL/usr/share/kodi/addons/script.service.zvfd
  cp $PKG_DIR/addon.xml $INSTALL/usr/share/kodi/addons/script.service.zvfd
  cp $PKG_DIR/default.py $INSTALL/usr/share/kodi/addons/script.service.zvfd

#  # update addon manifest
#  ADDON_MANIFEST=$(get_build_dir kodi)/.install_pkg/usr/share/kodi/system/addon-manifest.xml
#  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "script.service.zvfd" $ADDON_MANIFEST
}
