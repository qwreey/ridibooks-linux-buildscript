pkgname=ridibooks
pkgver=0.11.6
arch=(x86_64)
pkgdesc="Ridibooks desktop reader"
pkgrel=1
url="https://ridibooks.com"
makedepends=(sed 7zip curl grep nodejs npm)
source=("build.sh" "prepare.sh")
sha256sums=(
  "0c429e17d75fd048332ef455793be8a9ef2f7fe2f25ee2edd5eb39924ea95af7"
  "e8ca083d8fc36dc467e950c5e04c106e35b22711c525a2258a2c3b2a5ec422a8"
)

build() {
  ./build.sh
}

prepare() {
  ./prepare.sh
}

package() {
  install -Dm755 $srcdir/release/* "${pkgdir}/opt/${pkgname}"
}

