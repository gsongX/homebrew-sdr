class GrLimesdr < Formula
  desc "LimeSDR Plugin for GNURadio"
  homepage "https://wiki.myriadrf.org/Gr-limesdr_Plugin_for_GNURadio"
  url "https://github.com/myriadrf/gr-limesdr/archive/v2.0.0.tar.gz"
  sha256 "466dd049daf32531ed717b6c2daf07881cad27b7ce037c53cb947e5dadd948b8"
  head "https://github.com/myriadrf/gr-limesdr.git", :branch => "gr-3.8"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "python"
  depends_on "gmp"
  depends_on "swig"
  depends_on "gsongx/sdr/limesuite"
  depends_on "gsongx/sdr/gnuradio@3.8"

   # fix
  patch do
    url "https://raw.githubusercontent.com/gsongx/homebrew-sdr/master/patch/gr-limesdr-python3+gnuradio3.8.patch"
    sha256 "4aa968825c60d152c7f2a07125aa0aba0adbe156eb5420c9afca6582eb6f01ae"
  end

  def install
    python = Formulary.factory 'python3'

    args = %W[
      -DPYTHON_EXECUTABLE=#{python.bin}/python3
    ]
    mkdir "build" do
      system "cmake", "-G", "Ninja", "..", *(std_cmake_args + args)
      system "ninja"
      system "ninja", "install"
    end
  end

end
