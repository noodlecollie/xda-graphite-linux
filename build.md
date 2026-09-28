## Prerequisites

The developer environment prerequisites are listed in [buildroot_dev.ini](.distrobox/buildroot_dev.ini). I run
Bazzite at home (based on an atomic Fedora image), and Distrobox is their recommended way to set up developer
environments. The packages listed there can easily be transposed to other Ubuntu-based devcontainers too.

To build a Distrobox image and set everything up, run:

```bash
distrobox assemble create .distrobox/buildroot_dev.ini && distrobox enter buildroot_dev
```

Once inside the container, run `bootstrap.sh` once to set up the bits and pieces required for buildroot.
