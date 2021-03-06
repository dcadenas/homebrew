require 'formula'

class Zeromq <Formula
  url 'http://www.zeromq.org/local--files/area:download/zeromq-2.0.9.tar.gz'
  homepage 'http://www.zeromq.org/'
  md5 'eadda72ecc5bcfa50a521436e6d92252'

  def install
    fails_with_llvm "Compiling with LLVM gives a segfault while linking."
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end

  def caveats; <<-EOS.undent
    To install the zmq gem on Snow Leopard, on a 64-bit machine:
      $ ARCHFLAGS="-arch x86_64" gem install zmq -- --with-zmq-dir=#{HOMEBREW_PREFIX}
    EOS
  end
end
