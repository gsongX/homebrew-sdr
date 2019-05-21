class Gnuradio < Formula
  desc "SDK providing the signal processing runtime and processing blocks"
  homepage "https://gnuradio.org/"
  url "https://gnuradio.org/releases/gnuradio/gnuradio-3.7.13.5.tar.gz"
  sha256 "f14e1f8efbcbe04336b6981da207ada3306a8f08af2c0b4e9bb6f8b93036bbb9"
  revision 2
  head "https://github.com/gnuradio/gnuradio.git"

  depends_on "cmake" => :build
  depends_on "doxygen" => :build
  depends_on "pkg-config" => :build
  depends_on "sphinx-doc" => :build
  depends_on "swig" => :build
  depends_on "boost"
  depends_on "fftw"
  depends_on "gsl"
  depends_on "orc"
  depends_on "numpy"
  depends_on "pygtk"
  depends_on "portaudio"
  depends_on "python@2"
  depends_on "uhd"
  depends_on "zeromq"
  depends_on "wxpython"
  depends_on "freeglut"
  depends_on "log4cpp"
  depends_on "jack"
  depends_on "portaudio"
  depends_on "cppunit"
  depends_on "qwt"
  depends_on "pyqt"
  depends_on "wxmac"
  depends_on "libglade"


  # cheetah starts here
  resource "Markdown" do
    url "https://files.pythonhosted.org/packages/ac/df/0ae25a9fd5bb528fe3c65af7143708160aa3b47970d5272003a1ad5c03c6/Markdown-3.1.1.tar.gz"
    #url "https://files.pythonhosted.org/packages/b3/73/fc5c850f44af5889192dff783b7b0d8f3fe8d30b65c8e3f78f8f0265fecf/Markdown-2.6.11.tar.gz"
    sha256 "2e50876bcdd74517e7b71f3e7a76102050edec255b3983403f1a63e7c8a41e7a"
  end

  resource "Cheetah" do
    url "https://files.pythonhosted.org/packages/cd/b0/c2d700252fc251e91c08639ff41a8a5203b627f4e0a2ae18a6b662ab32ea/Cheetah-2.4.4.tar.gz"
    sha256 "be308229f0c1e5e5af4f27d7ee06d90bb19e6af3059794e5fd536a6f29a9b550"
  end
  # cheetah ends here

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/7d/29/174d70f303016c58bd790c6c86e6e86a9d18239fac314d55a9b7be501943/lxml-4.3.3.tar.gz"
    #url "https://files.pythonhosted.org/packages/54/a6/43be8cf1cc23e3fa208cab04ba2f9c3b7af0233aab32af6b5089122b44cd/lxml-4.2.3.tar.gz"
    sha256 "4a03dd682f8e35a10234904e0b9508d705ff98cf962c5851ed052e9340df3d90"
  end

  resource "MarkupSafe" do
    url "https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094/MarkupSafe-1.1.1.tar.gz"
    sha256 "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b"
  end

  resource "Mako" do
    url "https://files.pythonhosted.org/packages/f9/93/63f78c552e4397549499169198698de23b559b52e57f27d967690811d16d/Mako-1.0.10.tar.gz"
    #url "https://files.pythonhosted.org/packages/eb/69/6137c60cae2ab8c911bff510bb6d1d23a0189f75d114bb277606c6486b5f/Mako-1.0.8.tar.gz"
    sha256 "7165919e78e1feb68b4dbe829871ea9941398178fa58e6beedb9ba14acf63965"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/dd/bf/4138e7bfb757de47d1f4b6994648ec67a51efe58fa907c1e11e350cddfca/six-1.12.0.tar.gz"
    #url "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"
    sha256 "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73"
  end

  resource "cppzmq" do
    #url "https://github.com/zeromq/cppzmq/blob/master/zmq.hpp"
    #sha256 "61389f172371e6e5297afe571e1eb1bbd367782963c2361ceca96272518f97e9"
    url "https://raw.githubusercontent.com/zeromq/cppzmq/46fc0572c5e9f09a32a23d6f22fd79b841f77e00/zmq.hpp"
    sha256 "964031c0944f913933f55ad1610938105a6657a69d1ac5a6dd50e16a679104d5"
  end

  # use qt5 patch
  patch do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/gnuradio-qt5.patch"
    sha256 "60398e127ba72e6ccf33e7f8d5da800711e182c7e8d3016b8f9483500e89f321"
  end

  patch :DATA

  def install
    ENV.prepend_path "PATH", "/System/Library/Frameworks/Python.framework/Versions/2.7/bin"

    ENV["CHEETAH_INSTALL_WITHOUT_SETUPTOOLS"] = "1"
    ENV["XML_CATALOG_FILES"] = etc/"xml/catalog"
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"

    %w[Markdown Cheetah MarkupSafe Mako six].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    begin
      # Fix "ld: file not found: /usr/lib/system/libsystem_darwin.dylib" for lxml
      ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra

      resource("lxml").stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    ensure
      ENV.delete("SDKROOT")
    end

    resource("cppzmq").stage include.to_s

    args = std_cmake_args + %W[
      -DGR_PKG_CONF_DIR=#{etc}/gnuradio/conf.d
      -DGR_PREFSDIR=#{etc}/gnuradio/conf.d
      -DENABLE_DEFAULT=OFF
    ]

    enabled = %w[GR_ANALOG GR_FFT VOLK GR_FILTER GNURADIO_RUNTIME
                 GR_BLOCKS GR_PAGER GR_NOAA GR_CHANNELS GR_AUDIO
                 GR_FCD GR_VOCODER GR_FEC GR_DIGITAL GR_DTV GR_ATSC
                 GR_TRELLIS GR_ZEROMQ GR_WAVELET GR_UHD DOXYGEN SPHINX
                 PYTHON GR_UTILS GR_WXGUI GRC GR_QTGUI]
    enabled.each do |c|
      args << "-DENABLE_#{c}=ON"
    end
    #GR_CTRLPORT

    mkdir "build" do
      system "cmake", "..", *args
      system "make"
      system "make", "install"
    end

    rm bin.children.reject(&:executable?)
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gnuradio-config-info -v")

    (testpath/"test.c++").write <<~EOS
      #include <gnuradio/top_block.h>
      #include <gnuradio/blocks/null_source.h>
      #include <gnuradio/blocks/null_sink.h>
      #include <gnuradio/blocks/head.h>
      #include <gnuradio/gr_complex.h>

      class top_block : public gr::top_block {
      public:
        top_block();
      private:
        gr::blocks::null_source::sptr null_source;
        gr::blocks::null_sink::sptr null_sink;
        gr::blocks::head::sptr head;
      };

      top_block::top_block() : gr::top_block("Top block") {
        long s = sizeof(gr_complex);
        null_source = gr::blocks::null_source::make(s);
        null_sink = gr::blocks::null_sink::make(s);
        head = gr::blocks::head::make(s, 1024);
        connect(null_source, 0, head, 0);
        connect(head, 0, null_sink, 0);
      }

      int main(int argc, char **argv) {
        top_block top;
        top.run();
      }
    EOS
    system ENV.cxx, "-L#{lib}", "-L#{Formula["boost"].opt_lib}",
           "-lgnuradio-blocks", "-lgnuradio-runtime", "-lgnuradio-pmt",
           "-lboost_system", testpath/"test.c++", "-o", testpath/"test"
    system "./test"

    (testpath/"test.py").write <<~EOS
      from gnuradio import blocks
      from gnuradio import gr

      class top_block(gr.top_block):
          def __init__(self):
              gr.top_block.__init__(self, "Top Block")
              self.samp_rate = 32000
              s = gr.sizeof_gr_complex
              self.blocks_null_source_0 = blocks.null_source(s)
              self.blocks_null_sink_0 = blocks.null_sink(s)
              self.blocks_head_0 = blocks.head(s, 1024)
              self.connect((self.blocks_head_0, 0),
                           (self.blocks_null_sink_0, 0))
              self.connect((self.blocks_null_source_0, 0),
                           (self.blocks_head_0, 0))

      def main(top_block_cls=top_block, options=None):
          tb = top_block_cls()
          tb.start()
          tb.wait()

      main()
    EOS
    system "python2.7", testpath/"test.py"

    cd testpath do
      system "#{bin}/gr_modtool", "newmod", "test"

      cd "gr-test" do
        system "#{bin}/gr_modtool", "add", "-t", "general", "test_ff", "-l",
               "python", "-y", "--argument-list=''", "--add-python-qa",
               "--copyright=brew"
      end
    end
  end
end

__END__
diff --git a/cmake/Modules/FindQwt.cmake b/cmake/Modules/FindQwt.cmake
index 3ce49aa..4221310 100644
--- a/cmake/Modules/FindQwt.cmake
+++ b/cmake/Modules/FindQwt.cmake
@@ -5,6 +5,11 @@
 # qwt_global.h holds a string with the QWT version;
 #   test to make sure it's at least 5.2

+execute_process(
+  COMMAND /usr/local/bin/brew --prefix
+  OUTPUT_VARIABLE brew_prefix
+  OUTPUT_STRIP_TRAILING_WHITESPACE)
+
 find_path(QWT_INCLUDE_DIRS
   NAMES qwt_global.h
   HINTS
@@ -19,6 +24,7 @@ find_path(QWT_INCLUDE_DIRS
   /opt/local/include/qwt
   /sw/include/qwt
   /usr/local/lib/qwt.framework/Headers
+  ${brew_prefix}/opt/qwt/lib/qwt.framework/Headers
 )

 find_library (QWT_LIBRARIES
@@ -32,6 +38,7 @@ find_library (QWT_LIBRARIES
   /opt/local/lib
   /sw/lib
   /usr/local/lib/qwt.framework
+  ${brew_prefix}/opt/qwt/lib/qwt.framework
 )

 set(QWT_FOUND FALSE)
diff --git a/cmake/Modules/GrPython.cmake b/cmake/Modules/GrPython.cmake
index 06e061e21..ea58db8dd 100644
--- a/cmake/Modules/GrPython.cmake
+++ b/cmake/Modules/GrPython.cmake
@@ -106,7 +106,7 @@ endmacro(GR_PYTHON_CHECK_MODULE)
 if(NOT DEFINED GR_PYTHON_DIR)
 execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "
 from distutils import sysconfig
-print sysconfig.get_python_lib(plat_specific=True, prefix='')
+print sysconfig.get_python_lib(plat_specific=True)
 " OUTPUT_VARIABLE GR_PYTHON_DIR OUTPUT_STRIP_TRAILING_WHITESPACE
 )
 endif()
diff --git a/gr-utils/python/modtool/gr-newmod/cmake/Modules/GrPython.cmake b/gr-utils/python/modtool/gr-newmod/cmake/Modules/GrPython.cmake
index c7b402797..108d524aa 100644
--- a/gr-utils/python/modtool/gr-newmod/cmake/Modules/GrPython.cmake
+++ b/gr-utils/python/modtool/gr-newmod/cmake/Modules/GrPython.cmake
@@ -107,7 +107,7 @@ endmacro(GR_PYTHON_CHECK_MODULE)
 if(NOT DEFINED GR_PYTHON_DIR)
 execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "
 from distutils import sysconfig
-print sysconfig.get_python_lib(plat_specific=True, prefix='')
+print sysconfig.get_python_lib(plat_specific=True)
 " OUTPUT_VARIABLE GR_PYTHON_DIR OUTPUT_STRIP_TRAILING_WHITESPACE
 )
 endif()
diff --git a/grc/CMakeLists.txt b/grc/CMakeLists.txt
index 4c782a7f7..c352f6d2a 100644
--- a/grc/CMakeLists.txt
+++ b/grc/CMakeLists.txt
@@ -25,7 +25,7 @@ include(GrPython)
 GR_PYTHON_CHECK_MODULE("python >= 2.5"     sys          "sys.version.split()[0] >= '2.5'"           PYTHON_MIN_VER_FOUND)
 GR_PYTHON_CHECK_MODULE("Cheetah >= 2.0.0"  Cheetah      "Cheetah.Version >= '2.0.0'"                CHEETAH_FOUND)
 GR_PYTHON_CHECK_MODULE("lxml >= 1.3.6"     lxml.etree   "lxml.etree.LXML_VERSION >= (1, 3, 6, 0)"   LXML_FOUND)
-GR_PYTHON_CHECK_MODULE("pygtk >= 2.10.0"   gtk          "gtk.pygtk_version >= (2, 10, 0)"           PYGTK_FOUND)
+GR_PYTHON_CHECK_MODULE("pygtk >= 2.10.0"   pygtk        True                                        PYGTK_FOUND)
 GR_PYTHON_CHECK_MODULE("numpy"             numpy        True                                        NUMPY_FOUND)
