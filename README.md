# arduino_st4_goto

INDI Telescope driver that can add (very slow) goto functionality to any ST4
enabled telescope.

Not fully tested yet.

## Installation

* Install `libindi` from source. https://github.com/indilib/indi

```bash
make clean
make build
sudo make install
```

### Installing libindi on a Mac

You can install libindi on a mac easily as follows:

```bash
brew tap indilib/indi
```

Then use this brew formula to install `libindi`:

`libindi.rb`

```ruby
require 'formula'

class Libindi < Formula
  homepage 'http://www.indilib.org'
  head 'https://github.com/indilib/indi.git', :using => :git
  url 'https://github.com/indilib/indi/archive/v1.8.5.tar.gz'

  version "1.8.5-dev"

  depends_on 'cmake' => :build
  depends_on 'libnova'
  depends_on 'libcfitsio'
  depends_on 'libusb'
  depends_on 'libfftw'
  depends_on 'gsl'

  def install
    system "cmake", *std_cmake_args
    system "make", "install"
  end

end
```

```bash
brew install --build-from-source ./libindi.rb
```
