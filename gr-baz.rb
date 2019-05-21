require 'formula'

class GrBaz < Formula
  homepage 'http://wiki.spench.net/wiki/Gr-baz'
  head 'https://github.com/balint256/gr-baz.git'

  depends_on 'cmake' => :build
  depends_on "ninja" => :build
  depends_on 'gsong2014/sdr/gnuradio'

  def install
    mkdir 'build' do
      system 'cmake', '..', "-G", "Ninja", '-DPYTHON_LIBRARY=/usr/local/Frameworks/Python.framework/Versions/2.7/Python ', *std_cmake_args
      system 'ninja'
      system 'ninja install'
    end
  end
end
