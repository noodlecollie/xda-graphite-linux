## Prerequisites

The developer environment prerequisites are listed in [buildroot_dev.ini](.distrobox/buildroot_dev.ini). I run
Bazzite at home (based on an atomic Fedora image), and Distrobox is their recommended way to set up developer
environments. The packages listed there can easily be transposed to other Ubuntu-based devcontainers too,
or `apt install`-ed into your main Ubuntu system image if you like.

To build a Distrobox image and set everything up, run:

```bash
distrobox assemble create .distrobox/buildroot_dev.ini && distrobox enter buildroot_dev
```

Once inside the container, run `bootstrap.sh` once to set up the bits and pieces required for buildroot.

## Building the Linux Image

To build the Linux image using buildroot, run:

```bash
cd buildroot
make
```

The process will eventually produce an `output/images/zImage` file, which is the entire Linux system image. The first
run will take a long time (it has to build the entire Linux kernel), but subsequent runs will make use of previous
build artifacts.

For a deeper explanation of how this image is configured, see [configuration.md](configuration.md).
