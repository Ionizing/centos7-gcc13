set -ex

DOCKER_BUILDKIT=1 docker build --pull --no-cache \
 --tag docker.io/dmikhin/c7-gcc13:latest .
docker push docker.io/dmikhin/c7-gcc13:latest
