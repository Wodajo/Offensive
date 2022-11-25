`golang-go` only built on architectures that have a native toolchain ("gc compiler")
depends on:
	`golang-1.7-go` - compiler, linker, compiled stdlib
	`golang-src` - source files


if you want to build with whichever of `gc` or `gccgo` is available -> `golang-any`

[for new kali VMs](https://github.com/Dewalt-arch/pimpmykali)