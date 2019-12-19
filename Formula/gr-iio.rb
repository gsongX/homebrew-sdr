class GrIio < Formula
  desc "Osmocom GNU Radio Blocks"
  homepage "https://github.com/analogdevicesinc/gr-iio"
  head "https://github.com/eblot/gr-iio.git", :branch => "gr3.8-py3"

  depends_on "cmake" => :build
  depends_on "swig" => :build
  depends_on "ninja" => :build
  depends_on "boost" => :build
  #depends_on "doxygen" => :build
  depends_on "graphviz" => :build
  depends_on "flex" => :build
  depends_on "bison" => :build
  depends_on "python"
  # depends_on "gmp"
  # depends_on "mpir"
  depends_on "gsong2014/sdr/gnuradio@3.8"
  depends_on "gsong2014/sdr/libiio"
  depends_on "gsong2014/sdr/libad9361"
  depends_on "log4cpp"
  depends_on "swig"

  resource "Cheetah3" do
    url "https://files.pythonhosted.org/packages/4e/72/e6a7d92279e3551db1b68fd336fd7a6e3d2f2ec742bf486486e6150d77d2/Cheetah3-3.2.4.tar.gz"
    sha256 "caabb9c22961a3413ac85cd1e5525ec9ca80daeba6555f4f60802b6c256e252b"
  end

  # TODO:
  #   * fix installation path (iio/iio is likely wrong)
  #   * library version (version number do not exist, so lib is *uio....dylib)

  def install
    python = Formulary.factory 'python'
    libad9361 = Formulary.factory 'gsong2014/sdr/libad9361'
    pyver = 'python3.7'

    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/#{pyver}/site-packages"
    ENV.append "CXXFLAGS", "-std=c++11"

    resource("Cheetah3").stage do
      system "#{python.bin}/#{pyver}", *Language::Python.setup_install_args(libexec/"vendor")
    end

    args = %W[
      -DPYTHON_EXECUTABLE=#{python.bin}/python3
      -DAD9361_INCLUDE_DIRS=#{libad9361.prefix}/ad9361.framework/Headers
      -DAD9361_LIBRARIES=#{libad9361.prefix}/ad9361.framework
      -DENABLE_DOXYGEN:bool=false
    ]

    mkdir "build" do
      system "cmake", "-G", "Ninja", buildpath, *(std_cmake_args + args)
      system "ninja"
      system "ninja", "install"
    end
  end
end
