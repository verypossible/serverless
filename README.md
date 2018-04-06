# serverless

Automated Docker build for the Serverless framework

There are two `Dockerfile`s which are nearly the same.  One uses
Python 2 base image and the other Python 3.

These images are built in Docker Cloud.  The Serverless version to
build is specified as a build `ARG` (build argument) which is set
using `--build-arg` during the `docker build` command.  To pass this
argument, we need a Docker Cloud build hook which resides in
`hooks/build`.

# Instructions for updating versions

In order to bump the Serverless version, the only real requirement is
to change the version in the `hooks/build` file.  The `Makefile` also
has references to the Serverless version, _but this is really for
testing the build locally_.

My workflow is usually:

- Update versions in `Makefile` and run `make build`
- If the build works, update the versions in `hooks/build`
- Create PR
- On merge to `master`, Docker Hub will do the builds automatically.

See the following for more information on Docker Cloud build hooks:

https://docs.docker.com/docker-cloud/builds/advanced/#source-repository--branch-clones
