pkgname=ridibooks
pkgver=0.11.6
arch=(x86_64)
pkgdesc="Ridibooks desktop reader"
pkgrel=1
url="https://ridibooks.com"
makedepends=(sed 7zip curl grep nodejs npm)
source=("build.sh" "prepare.sh")

build() {
  ./build.sh
}

prepare() {
  ./prepare.sh
}

package() {
  install -Dm755 $srcdir/release/* "${pkgdir}/opt/${pkgname}"
}

