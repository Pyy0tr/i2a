# Maintainer: Pyy0tr <pierre45240@gmail.com>
pkgname=img2term
pkgver=1.0.0
pkgrel=1
pkgdesc="Convert any image into terminal art (ASCII or pixel) with background removal, ready for fastfetch"
arch=('any')
url="https://github.com/Pyy0tr/img2term"
license=('MIT')
depends=('imagemagick' 'jp2a' 'chafa')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0484da7ca8fbd2e40acb5858088b121fd47ed96c8f6dba1aa89a68f5275c2594')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 img2term "$pkgdir/usr/bin/img2term"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
