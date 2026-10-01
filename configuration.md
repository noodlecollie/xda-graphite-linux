## Buildroot

TODO: How to modify the configs using the ext tree?

### Crucial Configuration

There are a few basic configuration options that must be set in order for the Linux image to function correctly.

In `menuconfig`:

* **Target options** (these are all based on the device's CPU)
  * Target architecture: `ARM (little endian)`
  * Target architecture variant: `xscale`
  * Target ABI: `EABI`
* **Toolchain**
  * C library: `musl` (lightweight; useful comparison: https://www.etalabs.net/compare_libcs.html)
* **System configuration**
  * Init system: `busybox` (again, lightweight)
* **Kernel**
  * Linux kernel: `enable`
  * Kernel configuration: `using an in-tree defconfig file`
  * Defconfig name: `pxa` (the CPU architecture we're using)
* **Filesystem images**
  * Initramfs: `enable` (we want to start up from RAM)

And in `linux-menuconfig`:

* **System type**
  * PXA2xx/PXA3xx-based: `Support PXA27x platforms from device tree` (🔹)

(🔹) There does not appear to be a [specific Linux system type](https://www.arm.linux.org.uk/developer/machines/)
that exactly corresponds to the O2 XDA Graphite (or its ASUS Jupiter alias). We may actually need to make one of
our own, and this generic item may need to be revisited.

### Optional Configuration

There are some other configuration values that are not critical, but might be useful to set. They're listed here
so that I can come back to them to address them in future.

In `menuconfig`:

* **System Configuration**
  * System hostname
  * System banner
  * Root password

## HaRET

HaRET is configured using a file called `default.txt` that sits alongside the Linux image to be run.
See [sdcard/default.txt](sdcard/default.txt) for the current configuration, along with comments that
explain what each item does.
