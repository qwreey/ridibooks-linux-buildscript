pkgname=ridibooks
pkgver=0.11.6
arch=(x86_64)
pkgdesc="Ridibooks desktop reader"
pkgrel=1
url="https://ridibooks.com"
makedepends=(sed 7zip curl grep nodejs npm graphicsmagick)
source=("build.sh" "prepare.sh" "ridibooks.desktop")
sha256sums=(
  "c19e44e46fae4b9276b67e52cc2ec09356c56fec7d57c7d2c0c271bcbb6f3cbd"
  "f46b85e1d5216455acf709455ba7485bedc78390d2ff250d9106bd926861424c"
  "441fcad5296dca900f3722e97b20a3489624dd57f24e7129c0003ae2ff33a9f7"
)

build() {
  ./build.sh
}

prepare() {
  pkgver="$pkgver" pkgname="$pkgname" ./prepare.sh
}

package() {
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/share"
  cp -r $srcdir/release/* "${pkgdir}/opt/${pkgname}"
  cp -r $srcdir/icons "${pkgdir}/usr/share"
  install -Dm644 $srcdir/ridibooks.desktop "${pkgdir}/usr/share/applications/ridibooks.desktop"
  chmod o+xr,g+xr $pkgdir/opt $pkgdir/opt/$pkgname $pkgdir/usr $pkgdir/usr/share
}

