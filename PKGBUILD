# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Previous maintainer: Jouke Witteveen <j.witteveen@gmail.com>

pkgname=netcfg
pkgver=3.2
pkgrel=1
pkgdesc='Network configuration and profile scripts'
url='https://github.com/GNU-Pony/netcfg/'
license=(BSD)
backup=(etc/iftab etc/conf.d/netcfg)
groups=(base)
depends=(coreutils dhcpcd iproute2)
makedepends=(asciidoc)
conflicts=(netctl)
optdepends=('dialog: for the menu based profile and wifi selectors'
            'wpa_supplicant: for wireless networking support'
            'ifplugd: for automatic wired connections through net-auto-wired'
            'wpa_actiond: for automatic wireless connections through net-auto-wireless'
            'wireless_tools: for interface renaming through net-rename'
            'ifenslave: for bond connections'
            'bridge-utils: for bridge connections'
           )
source=("https://github.com/GNU-Pony/netcfg/archive/${pkgver}.tar.gz")
arch=(any)
sha256sums=(0ab51df0fa3c6eee2a3acbbd07df20e4638d3309c2f206123eecf5dda414e742)

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

