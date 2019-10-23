class Soapyiris < Formula
  desc "Soapy SDR plugin for Skylark Iris Module"
  homepage "https://github.com/skylarkwireless/sklk-soapyiris/wiki"
  head "https://github.com/skylarkwireless/sklk-soapyiris.wiki.git"
  url "https://github.com/skylarkwireless/sklk-soapyiris/archive/soapy-iris-2019.01.0.1.tar.gz"
  sha256 "e05c33ebe0d8b50222fe4c9ca7ea0d64f6c08ae9778b5c0a30a3558cd3134b1d"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "soapyremote" #runtime dependency

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
