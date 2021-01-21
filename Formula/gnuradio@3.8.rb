class GnuradioAT38 < Formula
  desc "SDK providing the signal processing runtime and processing blocks"
  homepage "https://gnuradio.org/"
  url "https://github.com/gnuradio/gnuradio/releases/download/v3.8.2.0/gnuradio-3.8.2.0.tar.xz"
  sha256 "3e293541a9ac8d78660762bae8b80c0f6195b3494e1c50c01a9fd79cc60bb624"
  head "https://github.com/gnuradio/gnuradio.git", :branch => "maint-3.8"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  #depends_on "doxygen" => :build
  depends_on "graphviz" => :build
  depends_on "pkg-config" => :build
  #depends_on "sphinx-doc" => :build
  depends_on "swig" => :build
  depends_on "boost"
  depends_on "fftw"
  depends_on "gsl"
  depends_on "numpy"
  depends_on "portaudio"
  depends_on "libyaml"
  depends_on "mpir"
  depends_on "python@3.9"
  depends_on "pygobject3"
  depends_on "gtk+3"
  depends_on "uhd"
  depends_on "zeromq"
  depends_on "pyqt"
  depends_on "qwt"
  depends_on "freeglut"
  depends_on "log4cpp"
  depends_on "volk"
  depends_on "gmp"
  depends_on "cppunit"
  depends_on "thrift"
  depends_on "orc"
  depends_on "sdl"
  depends_on "adwaita-icon-theme"


  patch do
    # block drag 'n drop does not work on GRC (Quartz backend)
    url "https://github.com/eblot/gnuradio/commit/5ee92ee7e2a9936615a494aa814fa31eda0398e7.patch"
    sha256 "5fe771f7304ff9463d5a7ef4468ab72924bba298a75326bd8807c3ee80301f15"
  end

  patch do
    # block drop (mouse button release) crashes (Quartz backend)
    url "https://github.com/eblot/gnuradio/commit/61be64deb0cdfc6b356d4391151b1134ddee7437.patch"
    sha256 "7d91fa9ebbb59a64d0d42b4ce47f8ebc3198c8c0796c859cef18a9ae1ea66c26"
  end

  patch :p0 do
    url "https://raw.githubusercontent.com/gsongx/homebrew-sdr/master/patch/patch-C_CXX_STANDARD.next.diff"
    sha256 "71e0fb7bc5e5f5a96d5e827bf5e2beed9f528b953686cf0d6b4eb7ed95445390"
  end

  patch :p0 do
    url "https://raw.githubusercontent.com/gsongx/homebrew-sdr/master/patch/patch-fixes_for-thrift.next.diff"
    sha256 "626b59ee948f14cb5a1152280532b1b2a5aa885d90fa62b1addba81f2dc8158b"
  end

  patch :p0 do
    url "https://raw.githubusercontent.com/gsongx/homebrew-sdr/master/patch/patch-fix-GNURadioControlPortClient-usage.next.diff"
    sha256 "fff82661a7643a2520b806b2e24d10a3d3fe7ff41d2afbd99a81d82e5c8228ef"
  end

  patch :DATA

  resource "Cheetah" do
    url "https://files.pythonhosted.org/packages/50/d5/34b30f650e889d0d48e6ea9337f7dcd6045c828b9abaac71da26b6bdc543/Cheetah3-3.2.5.tar.gz"
    sha256 "ececc9ca7c58b9a86ce71eb95594c4619949e2a058d2a1af74c7ae8222515eb1"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/27/6f/be940c8b1f1d69daceeb0032fee6c34d7bd70e3e649ccac0951500b4720e/click-7.1.2.tar.gz"
    sha256 "d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a"
  end

  resource "click-plugins" do
    url "https://files.pythonhosted.org/packages/5f/1d/45434f64ed749540af821fd7e42b8e4d23ac04b1eda7c26613288d6cd8a8/click-plugins-1.1.1.tar.gz"
    sha256 "46ab999744a9d831159c3411bb0c79346d94a444df9a3a3742e9ed63645f264b"
  end

  resource "Mako" do
    url "https://files.pythonhosted.org/packages/72/89/402d2b4589e120ca76a6aed8fee906a0f5ae204b50e455edd36eda6e778d/Mako-1.1.3.tar.gz"
    sha256 "8195c8c1400ceb53496064314c6736719c6f25e7479cd24c77be3d9361cddc27"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426/six-1.15.0.tar.gz"
    sha256 "30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/64/c2/b80047c7ac2478f9501676c988a5411ed5572f35d1beff9cae07d321512c/PyYAML-5.3.1.tar.gz"
    sha256 "b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d"
  end

  resource "cppzmq" do
    url "https://raw.githubusercontent.com/zeromq/cppzmq/46fc0572c5e9f09a32a23d6f22fd79b841f77e00/zmq.hpp"
    sha256 "964031c0944f913933f55ad1610938105a6657a69d1ac5a6dd50e16a679104d5"
  end


    # fix
  patch :p0 do
    url "https://raw.githubusercontent.com/gsongx/homebrew-sdr/master/patch/gnuradio-maint-3.8-c51f5ba.diff"
    sha256 "be99ffc8551f25bbc683222d27d03f00271b34154476500ba9ddb214fccc7c29"
  end

  # patch for boost 1.73.0, remove after next release
  # https://github.com/gnuradio/gnuradio/pull/3566
  patch do
    url "https://raw.githubusercontent.com/Homebrew/formula-patches/0d2af1812716a874d1e49268e999ea1a8ca9fc3c/gnuradio/boost-1.73.0.patch"
    sha256 "7e4abd08210d242d65807b7e2419f163a58b4630027a3beaff0e325d044266d7"
  end

  # Add -undefined dynamic_lookup linker flag back for macOS
  # https://github.com/gnuradio/gnuradio/pull/3674
  patch do
    url "https://github.com/gnuradio/gnuradio/commit/80ba62cb11cf604495e87a5e302e68eaf441eea9.patch?full_index=1"
    sha256 "d12640f62b266b244950d84f2deb1544f41574229106a525e693159fb3fc80eb"
  end


  def install
    python = Formulary.factory 'python'
    # python3 -c 'from sys import version_info; print("python%d.%d" % version_info[0:2])'
    pyver = "python3.9"

    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/#{pyver}/site-packages"

    ENV["CHEETAH_INSTALL_WITHOUT_SETUPTOOLS"] = "1"
    ENV["XML_CATALOG_FILES"] = etc/"xml/catalog"

    %w[Markdown Cheetah3 MarkupSafe Mako six pyyaml click click-plugins].each do |r|
      resource(r).stage do
        system  "#{python.bin}/#{pyver}", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    begin
      # Fix "ld: file not found: /usr/lib/system/libsystem_darwin.dylib" for lxml
      ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra

      resource("lxml").stage do
        system  "#{python.bin}/#{pyver}", *Language::Python.setup_install_args(libexec/"vendor")
      end
    ensure
      ENV.delete("SDKROOT")
    end

    resource("cppzmq").stage include.to_s

    qwt = Formulary.factory 'qwt'

    gmp = Formulary.factory 'gmp'
    mpir = Formulary.factory 'mpir'

    args = std_cmake_args + %W[
      -DGR_PKG_CONF_DIR=#{etc}/gnuradio/conf.d
      -DGR_PREFSDIR=#{etc}/gnuradio/conf.d
      -DPYTHON_EXECUTABLE=#{python.bin}/#{pyver}
      -DENABLE_DOXYGEN=Off
      -DENABLE_VOLK=Off
      -DENABLE_TESTING=ON
      -DPC_QWT_LIBRARIES=qwt
      -DPC_QWT_LIBDIR=#{qwt.lib}/qwt.framework
      -DPC_QWT_INCLUDEDIR=#{qwt.lib}/qwt.framework/Headers
      -DGMP_INCLUDE_DIR=#{gmp.prefix}/include
      -DGMP_LIBRARY=#{gmp.prefix}/lib/libgmp.dylib
      -DGMPXX_LIBRARY=#{gmp.prefix}/lib/libgmpxx.dylib
      -DMPIR_INCLUDE_DIR=#{mpir.prefix}/include
      -DMPIRXX_LIBRARY=#{mpir.prefix}/lib/libmpirxx.dylib
      -DMPIR_LIBRARY=#{mpir.prefix}/lib/libmpir.dylib
    ]

    # -DENABLE_DEFAULT=OFF

    enabled = %w[GR_ANALOG GR_FFT VOLK GR_FILTER GNURADIO_RUNTIME
                 GR_BLOCKS GR_CHANNELS GR_AUDIO GR_QTGUI
                 GR_VOCODER GR_FEC GR_DIGITAL GR_DTV
                 GR_TRELLIS GR_ZEROMQ GR_WAVELET GR_UHD
                 PYTHON GR_UTILS GRC]
    enabled.each do |c|
      args << "-DENABLE_#{c}=ON"
    end

    #DOXYGEN SPHINX : doc

    inreplace "docs/doxygen/Doxyfile.swig_doc.in" do |s|
      s.gsub! /USE_PDFLATEX\s+=\s+YES/, "USE_PDFLATEX = NO"
    end

    mkdir "build" do
      system "cmake", "-G", "Ninja", "..", *args
      system "ninja"
      system "ninja", "install"
    end

    ENV.prepend_create_path "PYTHONPATH", lib/"#{pyver}/site-packages"
    ENV.prepend_create_path "PYTHONPATH", lib/"#{pyver}/dist-packages"

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
    system #{python.bin}/#{pyver}, testpath/"test.py"

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
diff --git a/gnuradio-runtime/lib/pmt/CMakeLists.txt b/gnuradio-runtime/lib/pmt/CMakeLists.txt
index c46227e76..a073dee05 100644
--- a/gnuradio-runtime/lib/pmt/CMakeLists.txt
+++ b/gnuradio-runtime/lib/pmt/CMakeLists.txt
@@ -28,6 +28,7 @@ add_library(gnuradio-pmt
 target_link_libraries(gnuradio-pmt
   Boost::boost
   Log4Cpp::log4cpp
+  boost_thread-mt
 )
 
 target_include_directories(gnuradio-pmt
diff --git a/gr-audio/lib/CMakeLists.txt b/gr-audio/lib/CMakeLists.txt
index 91333b24d..e6a978090 100644
--- a/gr-audio/lib/CMakeLists.txt
+++ b/gr-audio/lib/CMakeLists.txt
@@ -28,6 +28,7 @@ target_include_directories(gnuradio-audio
   PUBLIC
   $<INSTALL_INTERFACE:include>
   $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../include>
+  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
   )
 
 list(APPEND gr_audio_confs ${CMAKE_CURRENT_SOURCE_DIR}/gr-audio.conf)

--- b/grc/core/platform.py  2019-08-10 04:40:00.000000000 +0700
+++ a/grc/core/platform.py  2019-09-26 07:08:09.000000000 +0700
@@ -237,9 +237,9 @@ class Platform(Element):
         if block_id in self.block_classes_build_in:
             log.warning('Not overwriting build-in block %s with %s', block_id, file_path)
             return
-        if block_id in self.blocks:
-            log.warning('Block with id "%s" loaded from\n  %s\noverwritten by\n  %s',
-                        block_id, self.blocks[block_id].loaded_from, file_path)
+        # if block_id in self.blocks:
+            # log.warning('Block with id "%s" loaded from\n  %s\noverwritten by\n  %s',
+                        # block_id, self.blocks[block_id].loaded_from, file_path)
 
         try:
             block_cls = self.blocks[block_id] = self.new_block_class(**data)
