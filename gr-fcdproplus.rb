class GrFcdproplus < Formula
  desc "gnuradio funcube dongle pro+ source"
  homepage ""
  head "https://github.com/ast/gr-fcdproplus.git"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "gsong2014/sdr/gnuradio"
  depends_on "hidapi"
  
  def install
    system "cmake", "-G", "Ninja", ".", *std_cmake_args
    system "ninja", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "true"
  end
end
