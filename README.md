# s6 for SWI-Prolog

Launches SWI-Prolog using skarnet.org's `s6` supervisor. See repo at
[GitHub](https://github.com/skarnet/s6).

## Usage

Build the Docker image using:

    docker build --pull --rm -f "Dockerfile" -t s6:latest "."

Run a container using:

    docker run --rm s6:latest

This is what you see.

    [s6-init] making user provided files available at /var/run/s6/etc...exited 0.
    [s6-init] ensuring user provided files have correct perms...exited 0.
    [fix-attrs.d] applying ownership & permissions fixes...    
    [fix-attrs.d] done.
    [cont-init.d] executing container initialization scripts...
    [cont-init.d] done.
    [services.d] starting services
    [services.d] done.
    1630557863.8114166
    % halt
    1630557866.8228261
    % halt
    1630557869.8333054
    % halt
