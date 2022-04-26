# docker-ci-internal

This repository contains the Dockerfile for building the private CI
Docker image used by the Zephyr CI.

The private CI Docker image is based on the [public CI Docker image]
and contains the proprietary toolchains and host tools that cannot be
included in the public CI Docker image due to legal reasons (e.g.
EULA prohibiting redistribution).

Note that this repository and the files required to build the private CI Docker
image are public -- only the final images are kept private to ensure that the
components contained in the image are not redistributed.

[public CI Docker image]: https://github.com/zephyrproject-rtos/docker-image
