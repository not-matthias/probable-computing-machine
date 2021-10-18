obj-m := project.o
project-objs := src/rust.o

all: src/rust.o
	$(call if_changed,make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules)

.PHONY:
fmt:
	cargo fmt

.PHONY:
clippy:
	cargo clippy

clean:
	cargo clean
	rm -rf rust_objs
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

src/rust.o: Cargo.toml src/lib.rs
	cargo rustc --release -Z build-std=core,alloc --target=x86_64-unknown-none-linuxkernel
	mkdir -p rust_objs
	cd rust_objs && ar x ../target/x86_64-unknown-none-linuxkernel/release/librust.a
	ld -r -o src/rust.o rust_objs/*.o
