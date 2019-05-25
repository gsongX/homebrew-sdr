require "formula"

class Libosmocore < Formula
  homepage "http://bb.osmocom.org/trac/wiki/libosmocore"
  #head "https://github.com/osmocom/libosmocore.git"
  url "https://github.com/osmocom/libosmocore/archive/1.1.0.tar.gz"
  sha256 "719372e536c47ead59aa2c56529cd8aa8d58875fc692bfe526f71e1cf85dad5a"
  head "https://github.com/nejohnson2/libosmocore.git"

  depends_on "libtool" => :build
  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "pkg-config" => :build
  depends_on "pcsc-lite"
  depends_on "talloc"
  depends_on "gnutls"


  patch do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/libosmocore-patch-01-fix_clock_gettime.release.diff.diff"
    sha256 "e6f197a8ee3b3f293004d8566759335da0303e24ab51cb4d27f620163db0c2ae"
  end

  patch do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/libosmocore-patch-02-fix-python.release.diff"
    sha256 "70906cd75ce005046c1bb8316bfa83a9f2e10c3def22747c314593560bcea6e1"
  end

  patch do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/libosmocore-patch-03-configure.ac.diff"
    sha256 "c8d4668b17d5d76eddfd81f40090c944d651fbf3fe2056cb0a4cefbfc7adfbf7"
  end

  patch do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/libosmocore-patch-04-include_osmocom_coding_gsm0503_parity.h.diff"
    sha256 "a6ba898ab5df7121a7ea90fe27629a48a5289ea9eec4caf31b00b9f2297118fb"
  end


  def install
    system "autoreconf", "-i"
    system "./configure", "--prefix=#{prefix}", "--disable-doxygen"
    system "make"
    system "make", "install"
  end
end
