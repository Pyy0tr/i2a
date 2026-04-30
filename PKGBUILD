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
sha256sums=('079236d17e07ac4a074f80b5de87c0ca1a89d52061fe579083450644e0375ede')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 img2term  "$pkgdir/usr/bin/img2term"
    install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
