## Two Bit Circus toochain for Intel Edison

The Intel Edison is a great little piece of hardware with a nice fast processor.  Though I ultimately plan to put together a cross-compiling toolchain for it, for the time being I'm relying on its built-in gcc.

Write code on your local machine in your preferred environment (I use vim).  Run `make remote` which will:
- sync the directory to the Edison
- execute `make` on the Edison to compile your code
- run the resulting binary, its output visible in your console

### HOWTO

1. Connect and configure your Intel Edison according to the [documentation](https://communities.intel.com/docs/DOC-23148)
1. Alter this Makefile, setting `EDISON` and `PASSWORD` appropriately.
1. Install [sshpass](http://sourceforge.net/projects/sshpass/) unless you love typing passwords.

### Notes

1. The Makefile assumes you'll be want to address GPIO, so it helpfully links the MRAA library.  Haven't gotten around to playing with UPM yet.  Try it out!
1. The included main.cpp is derived from Intel sources.



