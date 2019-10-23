class Soapyosmo < Formula
  desc "Soapy SDR plugins for OsmoSDR devices"
  homepage "https://github.com/pothosware/SoapyOsmo/wiki"
  head "https://github.com/pothosware/SoapyOsmo.git"
  url "https://github.com/pothosware/SoapyOsmo/archive/soapy-osmo-0.2.5.tar.gz"
  sha256 "95a81dbe296e95d928e31e5d7c55aea9acb90740a170caa9d9754f116c94e4d1"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "boost"
  depends_on "libmirisdr"
  depends_on "libosmosdr"
  depends_on "libbladerf"
  depends_on "airspy"
  depends_on "librtlsdr"
  depends_on "hackrf"

  def install
    mkdir "build" do
      system "cmake", "..", "-DUSE_OSMO_BLADERF=ON", "-DUSE_OSMO_AIRSPY=ON", "-DUSE_OSMO_RTLSDR=ON", "-DUSE_OSMO_HACKRF=ON", "-DENABLE_MIRI=ON" , *std_cmake_args
      system "make", "install"
    end
  end
end
