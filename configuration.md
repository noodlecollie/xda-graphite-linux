## Buildroot

The overall configuration for the Linux image that will run on the device is stored in `config/buildroot_config`.
Buildroot uses this to decide what to build, and how to do it.

If you've run `bootstrap.sh`, this file will be symlinked to `buildroot/.config` so that buildroot can see it. To edit
the configuration, there are two helper utilities you can run from within the `buildroot` directory:

```bash
# Configure the overall image. This includes things like what architecture you want to
# compile for, what toolchain you want to use, which version of the Linux kernel you
# want, how you want to package the image to be launched on your device, and so on.
make menuconfig

# Configure the options specific to the Linux kernel you are building.
# Note that for this to run correctly, you will need to have selected a Linux kernel
# version from menuconfig above, by going into the "Kernel" submenu and pressing
# Y to enable the Linux kernel feature.
make linux-menuconfig
```

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
