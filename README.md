# serverless

Automated Docker build for the Serverless framework

There are two `Dockerfile`s which are nearly the same.  One uses Python 2 base image and the other
Python 3.

These images are build from Docker Cloud.  The Serverless version to build is specified as a build
`ARG` (build argument) which is set using `--build-arg` during the `docker build` command.  To pass
this argument, we need a Docker Cloud build hook which resides in `hooks/build`. 

See the following for more information on Docker Cloud build hooks:

https://docs.docker.com/docker-cloud/builds/advanced/#source-repository--branch-clones
