clean:
	rm -Rf ./build

build:
	mkdir build && cd build && cmake .. && make

install: build
	cd build && make install
