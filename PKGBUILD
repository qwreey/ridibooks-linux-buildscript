pkgname=ridibooks
pkgver=0.11.6
arch=(x86_64)
pkgdesc="Ridibooks desktop reader"
pkgrel=1
url="https://ridibooks.com"
makedepends=(sed 7zip curl grep nodejs npm)
source=("build.sh" "prepare.sh" "ridibooks.desktop")
sha256sums=(
  "5a57fcd5e2994ca3b89bfe4b43a5ca8ec393e7fcf3a26fa559f46d18a7f53437"
  "989b13b89764b1bc99d3bb2903d68ace7cd07244c5f3e373d72a027dafa32d2f"
  "441fcad5296dca900f3722e97b20a3489624dd57f24e7129c0003ae2ff33a9f7"
)

build() {
  ./build.sh
}

prepare() {
  ./prepare.sh
}

package() {
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/share"
  cp -r $srcdir/release/* "${pkgdir}/opt/${pkgname}"
  cp -r $srcdir/icon "${pkgdir}/usr/share"
  install -dM644 $srcdir/ridibooks.desktop "${pkgdir}/usr/share/applications/ridibooks.desktop"
  chmod o+xr,g+xr $pkgdir/opt $pkgdir/opt/$pkgname $pkgdir/usr $pkgdir/usr/share
}

