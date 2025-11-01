# SPDX-FileCopyrightText: © 2025 Nfrastack <code@nfrastack.com>
#
# SPDX-License-Identifier: MIT

ARG \
    BASE_IMAGE

FROM ${BASE_IMAGE}

LABEL \
        org.opencontainers.image.title="S3QL" \
        org.opencontainers.image.description="FUSE Filesystem over top of remote S3 Buckets" \
        org.opencontainers.image.url="https://hub.docker.com/r/nfrastack/s3ql" \
        org.opencontainers.image.documentation="https://github.com/nfrastack/container-s3ql/blob/main/README.md" \
        org.opencontainers.image.source="https://github.com/nfrastack/container-s3ql.git" \
        org.opencontainers.image.authors="Nfrastack <code@nfrastack.com>" \
        org.opencontainers.image.vendor="Nfrastack <https://www.nfrastack.com>" \
        org.opencontainers.image.licenses="MIT"

ARG \
    S3QL_REPO_URL="https://github.com/s3ql/s3ql" \
    S3QL_VERSION="s3ql-5.4.1"

COPY CHANGELOG.md /usr/src/container/CHANGELOG.md
COPY LICENSE /usr/src/container/LICENSE
COPY README.md /usr/src/container/README.md

ENV \
    CONTAINER_ENABLE_SCHEDULING=TRUE \
    IMAGE_NAME="nfrastack/s3ql" \
    IMAGE_REPO_URL="https://github.com/nfrastack/container-s3ql/"

RUN echo "" && \
    S3QL_BUILD_DEPS_ALPINE=" \
                                attr-dev \
                                build-base \
                                #cython \
                                fuse-dev \
                                fuse3-dev  \
                                git \
                                linux-headers \
                                openssl-dev \
                                python3-dev \
                                sqlite-dev \
                            " \
                            && \
    S3QL_RUN_DEPS_ALPINE=" \
                            fuse3 \
                            python3 \
                            uv \
                         " \
                        && \
    \
    source /container/base/functions/container/build && \
    container_build_log image && \
    package update && \
    package upgrade && \
    package install \
                        S3QL_BUILD_DEPS \
                        S3QL_RUN_DEPS \
                        && \
    \
    clone_git_repo "${S3QL_REPO_URL}" "${S3QL_VERSION}" && \
    uv venv /opt/s3ql && \
    source /opt/s3ql/bin/activate && \
    uv pip install \
                    "apsw>=3.42.0" \
                    cryptography \
                    cython \
                    defusedxml \
                    "dugong>=3.4,<4.0" \
                    google-auth \
                    google-auth-oauthlib \
                    llfuse \
                    packaging \
                    "pyfuse3>=3.2.0,<4.0" \
                    pytest \
                    requests \
                    setuptools \
                    "trio>=0.15" \
                    && \
    uv build && \
    uv pip install dist/*.whl && \
    mkdir -p /opt/s3ql/share && \
    cp -R contrib/* /opt/s3ql/share && \
    \
    container_build_log add "S3QL" "${S3QL_VERSION}" "${S3QL_REPO_URL}" && \
    uv pip uninstall \
                    cython \
                    setuptools \
                    && \
    package remove \
                    S3QL_BUILD_DEPS \
                    && \
    package cleanup

COPY rootfs /
