class Gnuradio < Formula
  desc "SDK providing the signal processing runtime and processing blocks"
  homepage "https://gnuradio.org/"
  url "https://gnuradio.org/releases/gnuradio/gnuradio-3.7.13.5.tar.gz"
  sha256 "f14e1f8efbcbe04336b6981da207ada3306a8f08af2c0b4e9bb6f8b93036bbb9"
  revision 3
  head "https://github.com/gnuradio/gnuradio.git"

  depends_on "cmake" => :build
  #depends_on "doxygen" => :build
  depends_on "pkg-config" => :build
  #depends_on "sphinx-doc" => :build
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
  depends_on "freeglut"
  depends_on "log4cpp"
  depends_on "jack"
  depends_on "portaudio"
  depends_on "cppunit"
  depends_on "qwt"
  depends_on "pyqt"
  #depends_on "cartr/qt4/qwt-qt4"
  #depends_on "cartr/qt4/pyqt@4"
  #depends_on "wxpython"
  depends_on "wxmac"
  depends_on "sdl"
  depends_on "thrift"
  depends_on "codec2"


  # cheetah starts here
  resource "Markdown" do
    url "https://files.pythonhosted.org/packages/ac/df/0ae25a9fd5bb528fe3c65af7143708160aa3b47970d5272003a1ad5c03c6/Markdown-3.1.1.tar.gz"
    #url "https://files.pythonhosted.org/packages/b3/73/fc5c850f44af5889192dff783b7b0d8f3fe8d30b65c8e3f78f8f0265fecf/Markdown-2.6.11.tar.gz"
    #sha256 "a856869c7ff079ad84a3e19cd87a64998350c2b94e9e08e44270faef33400f81"
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
    url "https://raw.githubusercontent.com/zeromq/cppzmq/46fc0572c5e9f09a32a23d6f22fd79b841f77e00/zmq.hpp"
    sha256 "964031c0944f913933f55ad1610938105a6657a69d1ac5a6dd50e16a679104d5"
  end

  # fix
  patch :p0 do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/patch-cmake-expand.release.diff"
    sha256 "20b267903f7ecb5cba27ffcc650b08ba013744ef454a15978c09d4399ce020c6"
  end

  patch :p0 do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/patch-fix_ctrlport_test.release.diff"
    sha256 "1893da6101b11a9749a292efb509d1de7d8998ae9d208abe1aa022205f49b375"
  end

  patch :p0 do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/patch-C_CXX_STANDARD.release.diff"
    sha256 "a483a20a089ef9db4c1ec3a2976b9721f2de4b7f3efa9aeefce85ffbeb11555a"
  end

  patch :p0 do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/patch-fix-GNUCXX.release.diff"
    sha256 "62a09d5a6ae000f7a109860a1f893969653b3ac8e0078f0ecf4e3f78edd1359a"
  end

  patch :p0 do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/patch-fix-ctrlport-python-app-install-location.release.diff"
    sha256 "c9d10d25fc97359fc19d14441a6aa2ec07644c67186a4b607a0ff409cbceb6c9"
  end



  # devel version patch
  # patch do
  #   url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/patch-cmake-expand.devel.diff"
  #   sha256 "20b267903f7ecb5cba27ffcc650b08ba013744ef454a15978c09d4399ce020c6"
  # end

  # patch do
  #   url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/patch-fix_ctrlport_test.devel.diff"
  #   sha256 "3ca40164a2952f7ad3a5c7d56c2d94e97bbb71d27fa02c8478944f261e11d7d7"
  # end

  # patch do
  #   url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/patch-C_CXX_STANDARD.devel.diff"
  #   sha256 "6cf0aeb0a1104a9bfccc6ded069294a4429715a9b1a13c588f4b36a034dcee4c"
  # end

  # patch do
  #   url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/patch-fix-GNUCXX.devel.diff"
  #   sha256 "9e4c370d1b4dc2462e567e69f291c70ae0ae3445d2fc93c109bac1820e3d0a25"
  # end

  # patch do
  #   url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/patch-gnuradio-runtime_lib_buffer.cc.boost_include_fix.devel.diff"
  #   sha256 "c9662f1e1bb85eee09139d0c9ce2daee962519bc40d678e486295dc3a6177f94"
  # end

  # patch do
  #   url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/patch-fix-mp.devel.diff"
  #   sha256 "2d7efa33ae4e54dd160980b5823b2b1345d9892f5a8107a5a5494e164a9bb491"
  # end

  # patch do
  #   url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/patch-fix-ctrlport-python-app-install-location.devel.diff"
  #   sha256 "c9d10d25fc97359fc19d14441a6aa2ec07644c67186a4b607a0ff409cbceb6c9"
  # end

  # patch do
  #   url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/patch-fix-FindLog4cpp.devel.diff"
  #   sha256 "5bb21fcb01f66de680a656c0f791542007628805872a87b35af972a2279fdd8d"
  # end

  # patch do
  #   url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/patch-fix-rpc-unused-vars.devel.diff"
  #   sha256 "0829ce4c907d07bfb39fdc879829e065e3f862e0f1ba263b3d33feaa79a5a18b"
  # end

  

  #next version patch
  #patch do
  #  url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/patch-fix_includes.next.diff"
  #  sha256 "4406148772dd2c656c18e4959728b9ff8c1a8e4c9e63560a45d88e9eeb493e4f"
  #end

  # patch do
  #  url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/patch-C_CXX_STANDARD.next.diff"
  #  sha256 "69f2e25f0c688122e2ba97bc957a84480814d683607d5f78b9137aee46f7b49d"
  # end

  # use qt5 patch
  patch do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/gnuradio-qt5.patch"
    sha256 "72d6c9f8e0a2c3335d0bbd69b35b3e6ce719031ddfce9d514bf7756f8ee83326"
  end

  patch do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/linux/usr-bin-examples"
    sha256 "157f6015f2bbfd63be07d9cbb6bc3bfdb967a8646115e0ef7845064d223d77a9"
  end

  patch do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/linux/wxpy3"
    sha256 "bfc85156896bf55911297a15e5003c8eb9fc22b47292a485191e0c403e518018"
  end

  patch do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/linux/cmake-policies"
    sha256 "f2d956cc629272a8847bbb592b766862723f075e83db070f9ff221d9942d49bc"
  end

  patch do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/linux/gr-vocoder-codec2-subcomponent-using-external-codec2"
    sha256 "6e7b725d105e4ccff408c66f2f88c2b91ac184757587e14900df260a1ab5113a"
  end

  patch do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/linux/gr-vocoder-gsm-subcomponent-using-external-gsm-libra"
    sha256 "525064e51ad77c2a905e6af0750ba17daa582daae9d9f873cae26b4bc8c087dd"
  end

  patch do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/linux/fix-vocoder-test"
    sha256 "3e2c40b0a0daf001d5fb9df6dc1af9fe73377fd5780225ba403959fbe710acec"
  end

  patch do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/linux/runtime-replace-std-auto_ptr-usage-with-std-unique_p"
    sha256 "c400936cebdf06ccdb88d3259c7ed63094764e96d8505845935fe0d4847af0c8"
  end

  patch do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/linux/use-recent-cmake-features"
    sha256 "b61f9bbde868a21ec24230740aaa93160fe23593a1c893f8b238a0e86db0c4cc"
  end

  patch do
    url "https://raw.githubusercontent.com/gsong2014/homebrew-sdr/master/patch/fix_qt5_on_py2.patch"
    sha256 "a29bc19c6087708b7efb244a73a54e390108a9e4da56f013c9afc8df86d92329"
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
      -DENABLE_DOXYGEN=Off
    ]

    enabled = %w[GR_ANALOG GR_FFT VOLK GR_FILTER GNURADIO_RUNTIME
                 GR_BLOCKS GR_PAGER GR_NOAA GR_CHANNELS GR_AUDIO
                 GR_FCD GR_VOCODER GR_FEC GR_DIGITAL GR_DTV GR_ATSC
                 GR_TRELLIS GR_ZEROMQ GR_WAVELET GR_UHD GR_VIDEO_SDL
                 PYTHON GR_UTILS GR_WXGUI GRC GR_QTGUI GR_CTRLPORT]
    enabled.each do |c|
      args << "-DENABLE_#{c}=ON"
    end
    
    #DOXYGEN SPHINX : doc

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
+  ${brew_prefix}/opt/qwt-qt4/lib/qwt.framework/Headers
 )

 find_library (QWT_LIBRARIES
@@ -32,6 +38,7 @@ find_library (QWT_LIBRARIES
   /opt/local/lib
   /sw/lib
   /usr/local/lib/qwt.framework
+  ${brew_prefix}/opt/qwt-qt4/lib/qwt.framework/qwt
 )

 set(QWT_FOUND FALSE)
diff -uNrp a/gr-uhd/apps/uhd_fft b/gr-uhd/apps/uhd_fft
--- a/gr-uhd/apps/uhd_fft 2019-05-23 10:45:01.000000000 +0700
+++ b/gr-uhd/apps/uhd_fft 2019-05-23 10:47:33.000000000 +0700
@@ -54,7 +54,7 @@ except ImportError:
     from gnuradio.uhd.uhd_app import UHDApp
 
 
-class uhd_fft(gr.top_block, Qt.QWidget, UHDApp):
+class uhd_fft(gr.top_block, UHDApp, Qt.QWidget):
     """
     Simple UHD Spectrum Analyzer / Scope App.
     """
@@ -139,7 +139,7 @@ class uhd_fft(gr.top_block, Qt.QWidget, 
         self._samp_rate__line_edit = Qt.QLineEdit(eng_notation.num_to_str(self.samp_rate))
         self._samp_rate__tool_bar.addWidget(self._samp_rate__line_edit)
         self._samp_rate__line_edit.returnPressed.connect(
-            lambda: self.set_samp_rate(eng_notation.str_to_num(str(self._samp_rate__line_edit.text().toAscii()))))
+            lambda: self.set_samp_rate(eng_notation.str_to_num(self._samp_rate__line_edit.text())))
         self.top_grid_layout.addWidget(self._samp_rate__tool_bar, 3, 2, 1, 2)
         # Gain:
         self._gain__range = Range(
@@ -157,7 +157,7 @@ class uhd_fft(gr.top_block, Qt.QWidget, 
         self._freq_line_edit = Qt.QLineEdit(eng_notation.num_to_str(self.freq))
         self._freq_tool_bar.addWidget(self._freq_line_edit)
         self._freq_line_edit.returnPressed.connect(
-            lambda: self.set_freq_qt(eng_notation.str_to_num(str(self._freq_line_edit.text().toAscii()))))
+            lambda: self.set_freq_qt(eng_notation.str_to_num(self._freq_line_edit.text())))
         self.top_grid_layout.addWidget(self._freq_tool_bar, 3,0,1,2)
         # Antenna Selection:
         self._ant_labels = self._ant_options
@@ -234,7 +234,7 @@ class uhd_fft(gr.top_block, Qt.QWidget, 
         self.qtgui_time_sink_x_0.set_update_time(self.update_rate)
         self.qtgui_time_sink_x_0.set_y_axis(-1, 1)
         self.qtgui_time_sink_x_0.set_y_label("Amplitude", "")
-        self.qtgui_time_sink_x_0.enable_tags(-1, True)
+        self.qtgui_time_sink_x_0.enable_tags(0, True)
         self.qtgui_time_sink_x_0.set_trigger_mode(qtgui.TRIG_MODE_FREE, qtgui.TRIG_SLOPE_POS, 0.0, 0, 0, "")
         self.qtgui_time_sink_x_0.enable_autoscale(True)
         self.qtgui_time_sink_x_0.enable_grid(False)
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
