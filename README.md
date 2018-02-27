# Docker Image for Pa11y

Learn more about Pa11y at http://pa11y.org/. This image includes:
 * Pa11y CLI/library - https://github.com/pa11y/pa11y
 * Pa11y JSON, CSV and HTML reporting modules
 * Pa11y CI tool - https://github.com/pa11y/pa11y-ci
 * ESlint and the Pa11y config lint module - https://github.com/pa11y/pa11y-lint-config

## Getting started

Create a directory ("pa11y" in example below) with your config.json Pa11y configuration file and tests (see Pa11y documentation).

You can use the Docker Hub image (`civicactions/docker-pa11y`) to run the Pa11y CLI:
```
docker run -it --rm -v $(pwd)/pa11y:/home/node/app civicactions/pa11y pa11y
```

The mount into the /home/node/app directory (the default working directory in the container) will contain your test config.

A custom entrypoint will transparently run each command as a user with the UID/GID of the owner of the /home/node/app directory. This means that the external user with this UID/GID will have ownership of reports and screenshots created by Pa11y.

To run the Pa11y CI tool:
```
docker run -it --rm -v $(pwd)/pa11y:/home/node/app civicactions/pa11y pa11y-ci
```

To lint your pa11y config, follow the directions on https://github.com/pa11y/pa11y-lint-config then run eslint:
```
docker run -it --rm -v $(pwd)/pa11y:/home/node/app civicactions/pa11y eslint
```

## Building the image

To build this image from scratch clone this repository then run:
```
docker build -t pa11y .
```

You can use this image in the examples above by replacing `civicactions/pa11y` with `pa11y`.
