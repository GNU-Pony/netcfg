# Maintainer: Jouke Witteveen <j.witteveen@gmail.com>

pkgname=netcfg
pkgver=%pkgver%
pkgrel=1
pkgdesc="Network configuration and profile scripts"
url="http://archlinux.org/netcfg/"
license=("BSD")
backup=(etc/iftab etc/conf.d/netcfg)
groups=(base)
depends=("coreutils" "dhcpcd" "iproute2")
#makedepends=('asciidoc')  # The source tarball includes pre-built documentation.
optdepends=('dialog: for the menu based profile and wifi selectors'
            'wpa_supplicant: for wireless networking support'
            'ifplugd: for automatic wired connections through net-auto-wired'
            'wpa_actiond: for automatic wireless connections through net-auto-wireless'
            'wireless_tools: for interface renaming through net-rename'
            'ifenslave: for bond connections'
            'bridge-utils: for bridge connections'
           )
source=(ftp://ftp.archlinux.org/other/netcfg/netcfg-${pkgver}.tar.xz)
arch=(any)
md5sums=('%md5sum%')

package() {
  cd "$srcdir/netcfg-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/netcfg/LICENSE"

  # Shell Completion
  install -D -m644 contrib/bash-completion "$pkgdir/usr/share/bash-completion/completions/netcfg"
  install -D -m644 contrib/zsh-completion "$pkgdir/usr/share/zsh/site-functions/_netcfg"

  # Compatibility
  ln -s netcfg.service "$pkgdir/usr/lib/systemd/system/net-profiles.service"
}

