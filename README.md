# docker-ci-internal

This repository contains the Dockerfile for building the private CI
Docker image used by the Zephyr CI.

The private CI Docker image is based on the [public CI Docker image]
and contains the proprietary toolchains and host tools that cannot be
included in the public CI Docker image due to legal reasons (e.g.
EULA prohibiting redistribution).

[public CI Docker image]: https://github.com/zephyrproject-rtos/docker-image
