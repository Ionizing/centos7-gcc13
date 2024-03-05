set -ex

docker run -it --rm \
 -v `realpath ./scripts`:/tmp/build \
 centos:7 /tmp/build/build.sh
