require "formula"

class Libosmocore < Formula
  homepage "http://bb.osmocom.org/trac/wiki/libosmocore"
  head "https://github.com/osmocom/libosmocore.git"

  depends_on "libtool" => :build
  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "pkg-config" => :build
  depends_on "pcsc-lite"
  depends_on "talloc"

  def install
    system "autoreconf", "-i"
    system "./configure", "--prefix=#{prefix}", "--disable-doxygen"
    system "make"
    system "make", "install"
  end
end
