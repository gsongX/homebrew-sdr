class Volk < Formula
  include Language::Python::Virtualenv

  desc "The Vector Optimized Library of Math Kernels"
  homepage "http://libvolk.org/"
  url "https://github.com/gnuradio/volk/archive/v2.1.0.tar.gz"
  head "https://github.com/gnuradio/volk.git"
  sha256 "fe422f10b880d10cb72bdd1a3362a0f65d2d6d655dd1296459773c89fae51781"
  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "python" => :build

  resource "MarkupSafe" do
    url "https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094/MarkupSafe-1.1.1.tar.gz"
    sha256 "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b"
  end

  resource "Mako" do
    url "https://files.pythonhosted.org/packages/b0/3c/8dcd6883d009f7cae0f3157fb53e9afb05a0d3d33b3db1268ec2e6f4a56b/Mako-1.1.0.tar.gz"
    sha256 "a36919599a9b7dc5d86a7a8988f23a9a3a3d083070023bab23d64f7f1d1e0a4b"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python3.7/site-packages"
    pyver = "python3.7"

    python = Formulary.factory 'python'

    resource("MarkupSafe").stage do
      system "#{python.bin}/#{pyver}", *Language::Python.setup_install_args(libexec/"vendor")
    end

    resource("Mako").stage do
      system "#{python.bin}/#{pyver}", *Language::Python.setup_install_args(libexec/"vendor")
    end

    mktemp do
      args = %W[
        -DPYTHON_EXECUTABLE=#{python.bin}/python3
      ]
      system "cmake", "-G", "Ninja", buildpath, *(std_cmake_args + args)
      system "ninja"
      system "ninja", "install"
    end
  end

end
