class GrOsmosdr < Formula
  desc "Osmocom GNU Radio Blocks"
  homepage "https://osmocom.org/projects/sdr/wiki/GrOsmoSDR"
  # pristine tarballs are too old
  head "https://github.com/eblot/gr-osmosdr.git", :branch => "python3-gqrx"

  depends_on "cmake" => :build
  depends_on "swig" => :build
  depends_on "ninja" => :build
  depends_on "boost" => :build
  #depends_on "doxygen" => :build
  depends_on "graphviz" => :build
  depends_on "uhd"
  depends_on "airspy"
  depends_on "python"
  depends_on "gmp"
  depends_on "mpir"
  depends_on "gsong2014/sdr/gnuradio@3.8"
  depends_on "gsong2014/sdr/gr-iio"
  depends_on "librtlsdr"
  depends_on "log4cpp"
  depends_on "swig"

  patch do
    url "https://gist.githubusercontent.com/eblot/4ac69e4d72fdbab36906f7c086289b63/raw/30a33a9f2a16159053e560e0be0771175dffd28a/gr-osmosdr-clang.patch"
    sha256 "7e94dd33a3b747cdc1b25942c9061f8d5415612c4f8f28f923ef52c8cf84e4a7"
  end

  resource "Cheetah3" do
    url "https://files.pythonhosted.org/packages/4e/72/e6a7d92279e3551db1b68fd336fd7a6e3d2f2ec742bf486486e6150d77d2/Cheetah3-3.2.4.tar.gz"
    sha256 "caabb9c22961a3413ac85cd1e5525ec9ca80daeba6555f4f60802b6c256e252b"
  end

  def install
    python = Formulary.factory 'python'
    gnuradio = Formulary.factory 'gsong2014/sdr/gnuradio@3.8'
    pyver = 'python3.7'

    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/#{pyver}/site-packages"
    ENV.append "CXXFLAGS", "-std=c++11"

    resource("Cheetah3").stage do
      system "#{python.bin}/#{pyver}", *Language::Python.setup_install_args(libexec/"vendor")
    end

    args = %W[
      -DPYTHON_EXECUTABLE=#{python.bin}/python3
    ]

    mkdir "build" do
      system "cmake", "-G", "Ninja", buildpath, *(std_cmake_args + args)
      system "ninja"
      system "ninja", "install"
    end
  end
end
