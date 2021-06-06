pkgname=ashellwig_csc161_m1_pa_swimming-pool-bin
_pkgname=ashellwig_csc161_m1_pa_swimming-pool

pkgver=0.0.1
pkgrel=1

pkgdesc="Solution to FRCC/CCCOnline SP2020 CSC160: C++ course's assignment"
pkgdesc+=" in Module 5 for Chapter 10."

source=(
  "$pkgname::git+https://github.com/ashellwig/ashellwig_csc161_m1_pa_swimming-pool.git#branch=master"
)

url="https://github.com/ashellwig/ashellwig_csc161_m1_pa_swimming-pool"
license=('LGPLv3')
privides=('ashellwig_csc161_m1_pa_swimming-pool')
conflicts=('ashellwig_csc161_m1_pa_swimming-pool')

arch=('x86_64')
makedepends=('cmake' 'gcc-libs' 'make' 'latex-core')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}" || exit 2
  set -o pipefail
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || echo 0.0.1
}

prepare() {
  true
}

build() {
  true
}

check() {
  true
}

install() {
  true
}
