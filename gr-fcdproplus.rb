class GrFcdproplus < Formula
  desc "gnuradio funcube dongle pro+ source"
  homepage ""
  head "https://github.com/ast/gr-fcdproplus.git"

  depends_on "cmake" => :build
  depends_on "gnuradio"
  depends_on "hidapi"
  
  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "true"
  end
end
