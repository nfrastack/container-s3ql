# nfrastack/container-s3ql

## About

This repository will build a container for [S3QL](http://www.rath.org/s3ql-docs/)), A deduplicating, compressing virtual filesystem that works on S3 compatible buckets.

## Maintainer

- [Nfrastack](https://www.nfrastack.com)

## Table of Contents

- [About](#about)
- [Maintainer](#maintainer)
- [Table of Contents](#table-of-contents)
- [Installation](#installation)
  - [Prebuilt Images](#prebuilt-images)
    - [Multi-Architecture Support](#multi-architecture-support)
  - [Quick Start](#quick-start)
  - [Persistent Storage](#persistent-storage)
  - [Environment Variables](#environment-variables)
    - [Base Images used](#base-images-used)
    - [Core Configuration](#core-configuration)
    - [S3QL Configuration](#s3ql-configuration)
- [Users and Groups](#users-and-groups)
  - [Networking](#networking)
- [Maintenance](#maintenance)
  - [File System Maintenance](#file-system-maintenance)
  - [Transport endpoint not connected](#transport-endpoint-not-connected)
  - [Shell Access](#shell-access)
- [Support \& Maintenance](#support--maintenance)
- [References](#references)
- [License](#license)

## Installation

### Prebuilt Images
Feature limited builds of the image are available on the [Github Container Registry](https://github.com/nfrastack/container-s3ql/pkgs/container/container-s3ql) and [Docker Hub](https://hub.docker.com/r/nfrastack/s3ql).

To unlock advanced features, one must provide a code to be able to change specific environment variables from defaults. Support the development to gain access to a code.

To get access to the image use your container orchestrator to pull from the following locations:

```
ghcr.io/nfrastack/container-s3ql:(image_tag)
docker.io/nfrastack/s3ql:(image_tag)
```

Image tag syntax is:

`<image>:<optional tag>-<optional_distribution>_<optional_distribution_variant>`

Example:

`ghcr.io/nfrastack/container-s3ql:latest` or

`ghcr.io/nfrastack/container-s3ql:1.0`

* `latest` will be the most recent commit
* An otpional `tag` may exist that matches the [CHANGELOG](CHANGELOG.md) - These are the safest
* If it is built for multiple distributions there may exist a value of `alpine` or `debian`
* If there are multiple distribution variations it may include a version - see the registry for availability

Have a look at the container registries and see what tags are available.

#### Multi-Architecture Support

Images are built for `amd64` by default, with optional support for `arm64` and other architectures.

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [compose.yml](examples/compose.yml) that can be modified for your use.

* Map [persistent storage](#persistent-storage) for access to configuration and data files for backup.
* Set various [environment variables](#environment-variables) to understand the capabilities of this image.

### Persistent Storage

The following directories are used for configuration and can be mapped for persistent storage.

| Directory | Description         |
| --------- | ------------------- |
| `/config` | Configuration Files |
| `/data`   | Mounted Data        |
| `/logs`   | Log Files           |

### Environment Variables

#### Base Images used

This image relies on a customized base image in order to work.
Be sure to view the following repositories to understand all the customizable options:

| Image                                                   | Description |
| ------------------------------------------------------- | ----------- |
| [OS Base](https://github.com/nfrastack/container-base/) | Base Image  |

Below is the complete list of available options that can be used to customize your installation.

* Variables showing an 'x' under the `Advanced` column can only be set if the containers advanced functionality is enabled.

#### Core Configuration

| Parameter         | Description                                                            | Default     | Advanced | `_FILE` |
| ----------------- | ---------------------------------------------------------------------- | ----------- | -------- | ------- |
| `S3QL_SETUP_TYPE` | Auto Configure Configuration each startup - Set to `MANUAL` to disable | `AUTO`      |          | |
| `CACHE_PATH`      | Cache Directory Path                                                   | `/cache/`   |          | |
| `CONFIG_FILE`     | Configuration File with credentials                                    | `s3ql.conf` |          | |
| `CONFIG_PATH`     | Configuration Path                                                     | `/config/`  |          | |
| `DATA_PATH`       | Path to mount S3QL File System                                         | `/data/`    |          | |
| `LOG_PATH`        | Path for Log Files                                                     | `/logs/`    |          | |
| `LOG_TYPE`        | `CONSOLE` or `FILE`                                                    | `FILE`      |          | |

#### S3QL Configuration

| Parameter                 | Description                                                             | Default  | Advanced | `_FILE` |
| ------------------------- | ----------------------------------------------------------------------- | -------- | -------- | ---- |
| `CACHE_SIZE`              | Cache size in KiB - eg `9765625` for 10GB or `auto`                     | `auto`   |          |  |
| `COMPRESSION`             | Compresion type `none` `bzip` `lzma` `zlib` and compression level `0-9` | `lzma-6` |          | |
| `ENABLE_CACHE`            | Enable Cache on File system                                             | `TRUE`   |          | |
| `ENABLE_PERSISTENT_CACHE` | Enable Cache even after filesystem is not mounted                       | `TRUE`   |          | |
| `FSCK_ARGS`               | Arguments to pass to fsck process on container start                    | ``       |          | x |
| `MKFS_ARGS`               | Arguments to pass to mkfs process when making filesystem                | ``       |          | x|
| `MOUNT_ARGS`              | Arguments to pass to mount process when mounting filesystem             | ``       |          | x|
| `S3_KEY_ID`               | S3 Key ID                                                               | ``       |          | x |
| `S3_KEY_SECRET`           | S3 Key Secret                                                           | ``       |          | x |
| `S3_URI`                  | URI of S3 Bucket eg `s3c://s3.provider:443/bucket_name`                 | ``       |          | x |
| `S3QL_PASS`               | (Optional) Encrypted password for S3QL Filesystem                       | ``       |          | x|

## Users and Groups

| Type | Name | ID  |
| ---- | ---- | --- |

### Networking

| Port | Protocol | Description |
| ---- | -------- | ----------- |

* * *

## Maintenance
### File System Maintenance
- If you would like to perform file system maintenance, first make sure the file system is dismounted by executing `service_down 10-s3ql` and then execute `fsck-now` . Make sure to mount the filesystem again by executing `service_up 10-s3ql`

### Transport endpoint not connected
- If at some time you experience the issue of not being able to unmount your filesystem, try entering into the container and executing `force-dismount` which should allow the filesystem to be dismounted.


### Shell Access

For debugging and maintenance, `bash` and `sh` are available in the container.


## Support & Maintenance

- For community help, tips, and community discussions, visit the [Discussions board](/discussions).
- For personalized support or a support agreement, see [Nfrastack Support](https://nfrastack.com/).
- To report bugs, submit a [Bug Report](issues/new). Usage questions will be closed as not-a-bug.
- Feature requests are welcome, but not guaranteed. For prioritized development, consider a support agreement.
- Updates are best-effort, with priority given to active production use and support agreements.

## References

* [<http://www.rath.org/s3ql-docs>](http://www.rath.org/s3ql-docs/)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
