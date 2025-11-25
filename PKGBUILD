pkgname=ridibooks
pkgver=0.11.6
arch=(x86_64)
pkgdesc="Ridibooks desktop reader"
pkgrel=1
url="https://ridibooks.com"
makedepends=(sed 7zip curl grep nodejs npm)
source=("build.sh" "prepare.sh")
sha256sums=(
  "d28a36747f77364fd76c0b66f968e13dc76efbf986f0df627259ca2cf7eec440"
  "500cd58c612e4fa00a9ef6af8e870350324f768d7bd259a5bd22f2ca7c6eef6b"
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

