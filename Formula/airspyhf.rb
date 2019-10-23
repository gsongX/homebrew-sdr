class Airspyhf < Formula
  desc "AirspyHF+ high performance software defined radio for the HF and VHF bands"
  homepage "https://github.com/airspy/airspyhf"
  head "https://github.com/airspy/airspyhf.git"
  url "https://github.com/airspy/airspyhf/archive/1.1.5.tar.gz"
  sha256 "270c332e16677469d7644053e4905106ef0aa52f0da10fd9f22cca05fe1dd2ef"

  depends_on "cmake" => :build
  depends_on "libusb"

  def install
    args = []

    args += ["-DLIBUSB_INCLUDE_DIR=/usr/local/include/libusb-1.0"]

    mkdir "builddir" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
