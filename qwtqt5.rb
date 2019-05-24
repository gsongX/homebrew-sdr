class Qwtqt5 < Formula
  desc "Qt Widgets for Technical Applications (v5.1)"
  homepage "http://qwt.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/qwt/qwt/6.1.4/qwt-6.1.4.tar.bz2"
  sha256 "1529215329e51fc562e0009505a838f427919a18b362afff441f035b2d9b5bd9"

  option "with-qwtmathml", "Build the qwtmathml library"
  option "without-plugin", "Skip building the Qt Designer plugin"

  depends_on "qt"

  # Update designer plugin linking back to qwt framework/lib after install
  # See: https://sourceforge.net/p/qwt/patches/45/
  patch :DATA

  def install
    inreplace "qwtconfig.pri" do |s|
      s.gsub! /^\s*QWT_INSTALL_PREFIX\s*=(.*)$/, "QWT_INSTALL_PREFIX=#{prefix}"
      s.sub! /\+(=\s*QwtDesigner)/, "-\\1" if build.without? "plugin"

      # Install Qt plugin in `lib/qt/plugins/designer`, not `plugins/designer`.
      s.sub! %r{(= \$\$\{QWT_INSTALL_PREFIX\})/(plugins/designer)$},
             "\\1/lib/qt/\\2" if build.without? "plugin"
    end

    args = ["-config", "release", "-spec"]
    
    if ENV.compiler == :clang
      args << "macx-clang"
    else
      args << "macx-g++"
    end

    if build.with? "qwtmathml"
      args << "QWT_CONFIG+=QwtMathML"
      prefix.install "textengines/mathml/qtmmlwidget-license"
    end

    system "qmake", *args
    system "make"
    system "make", "install"

    # symlink Qt Designer plugin (note: not removed on qwt formula uninstall)
    ln_sf prefix/"plugins/designer/libqwt_designer_plugin.dylib",
          Formula["qt"].opt_prefix/"plugins/designer/" if build.with? "plugin"
  end

  def caveats
    if build.with? "qwtmathml"; <<-EOS.undent
        The qwtmathml library contains code of the MML Widget from the Qt solutions package.
        Beside the Qwt license you also have to take care of its license:
        #{opt_prefix}/qtmmlwidget-license
      EOS
    end
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <qwt_plot_curve.h>
      int main() {
        QwtPlotCurve *curve1 = new QwtPlotCurve("Curve 1");
        return (curve1 == NULL);
      }
    EOS
    system ENV.cxx, "test.cpp", "-o", "out",
      "-std=c++11",
      "-framework", "qwt", "-framework", "QtCore",
      "-F#{lib}", "-F#{Formula["qt"].opt_lib}",
      "-I#{lib}/qwt.framework/Headers",
      "-I#{Formula["qt"].opt_lib}/QtCore.framework/Versions/5/Headers",
      "-I#{Formula["qt"].opt_lib}/QtGui.framework/Versions/5/Headers"
    system "./out"
  end
end

__END__
diff --git a/designer/designer.pro b/designer/designer.pro
index c269e9d..c2e07ae 100644
--- a/designer/designer.pro
+++ b/designer/designer.pro
@@ -126,6 +126,16 @@ contains(QWT_CONFIG, QwtDesigner) {

     target.path = $${QWT_INSTALL_PLUGINS}
     INSTALLS += target
+
+    macx {
+        contains(QWT_CONFIG, QwtFramework) {
+            QWT_LIB = qwt.framework/Versions/$${QWT_VER_MAJ}/qwt
+        }
+        else {
+            QWT_LIB = libqwt.$${QWT_VER_MAJ}.dylib
+        }
+        QMAKE_POST_LINK = install_name_tool -change $${QWT_LIB} $${QWT_INSTALL_LIBS}/$${QWT_LIB} $(DESTDIR)$(TARGET)
+    }
 }
 else {
     TEMPLATE        = subdirs # do nothing
