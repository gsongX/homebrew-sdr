class GrOsmosdr < Formula
  desc "Osmocom GNU Radio Blocks"
  homepage "https://osmocom.org/projects/sdr/wiki/GrOsmoSDR"
  url "https://github.com/osmocom/gr-osmosdr/archive/v0.1.4.tar.gz"
  sha256 "bcf9a9b1760e667c41a354e8cd41ef911d0929d5e4a18e0594ccb3320d735066"
  head "https://github.com/osmocom/gr-osmosdr.git"

  depends_on "cmake" => :build
  depends_on "swig" => :build
  depends_on "ninja" => :build
  depends_on "python@2"
  depends_on "boost"
  depends_on "uhd"
  depends_on "airspy"
  depends_on "gsong2014/sdr/gnuradio@3.7"
  depends_on "librtlsdr"

  patch do
    url "https://gist.githubusercontent.com/eblot/4ac69e4d72fdbab36906f7c086289b63/raw/30a33a9f2a16159053e560e0be0771175dffd28a/gr-osmosdr-clang.patch"
    sha256 "7e94dd33a3b747cdc1b25942c9061f8d5415612c4f8f28f923ef52c8cf84e4a7"
  end

  patch do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/gr-osmosdr-01-fix-include-directories-ordering.diff"
    sha256 "ad38157570c9ff29448ee80e5823c828f77f20b3192b7a38e6ff15a8533d0a17"
  end

  resource "Cheetah" do
    url "https://files.pythonhosted.org/packages/source/C/Cheetah/Cheetah-2.4.4.tar.gz"
    sha256 "be308229f0c1e5e5af4f27d7ee06d90bb19e6af3059794e5fd536a6f29a9b550"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"

    resource("Cheetah").stage do
      system "python", *Language::Python.setup_install_args(libexec/"vendor")
    end

    mktemp do
      system "cmake", "-G", "Ninja", buildpath, *std_cmake_args
      system "ninja"
      system "ninja", "install"
    end
  end
end
