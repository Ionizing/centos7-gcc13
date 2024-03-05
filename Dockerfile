# syntax=docker/dockerfile:experimental
FROM centos:centos7

RUN --mount=type=bind,target=/tmp/build,source=scripts,ro \
    /tmp/build/build.sh
