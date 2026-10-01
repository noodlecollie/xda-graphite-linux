## Prerequisites

The developer environment prerequisites are listed in [buildroot_dev.ini](.distrobox/buildroot_dev.ini). I run
Bazzite at home (based on an atomic Fedora image), and Distrobox is their recommended way to set up developer
environments. The packages listed there can easily be transposed to other Ubuntu-based devcontainers too,
or `apt install`-ed into your main Ubuntu system image if you like.

To build a Distrobox image and set everything up, run:

```bash
distrobox assemble create .distrobox/buildroot_dev.ini && distrobox enter buildroot_dev
```

## Building the Linux Image

For a deep explanation of how the Linux image is configured, see [configuration.md](configuration.md).

TODO: Build instructions
