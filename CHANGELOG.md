## 2.0.0 2025-08-17 <dave at tiredofit dot ca>

   ### Added
      - Switch to nfrastack/container-base
      - Alpine 3.22
      - Use UV for dependency management


## 1.6.99 2025-08-17 <dave at tiredofit dot ca>

Provide notification of Image EOL


## 1.6.21 2025-05-10 <dave at tiredofit dot ca>

   ### Added
      - Switch to Alpine Edge for Go 1.24 buildchain


## 1.6.20 2025-05-10 <dave at tiredofit dot ca>

   ### Added
      - S3QL 5.3.0


## 1.6.19 2024-12-07 <dave at tiredofit dot ca>

   ### Added
      - Pin to tiredofit/alpine:3.21


## 1.6.18 2024-11-02 <dave at tiredofit dot ca>

   ### Added
      - S3QL 5.2.3


## 1.6.17 2024-09-01 <dave at tiredofit dot ca>

   ### Added
      - S3QL 5.2.2


## 1.6.16 2024-07-05 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.20 base
      - S3QL 5.2.1


## 1.6.15 2024-04-19 <dave at tiredofit dot ca>

   ### Added
      - S3QL 5.2.0


## 1.6.14 2023-12-08 <dave at tiredofit dot ca>

   ### Changed
      - Fix duplicate upgrade prompt


## 1.6.13 2023-12-08 <dave at tiredofit dot ca>

   ### Changed
      - Break system packages


## 1.6.12 2023-12-08 <dave at tiredofit dot ca>

   ### Changed
      - Remove fsck args


## 1.6.11 2023-12-08 <dave at tiredofit dot ca>

   ### Changed
      - Remove compression options on upgrade


## 1.6.10 2023-12-08 <dave at tiredofit dot ca>

   ### Changed
      - Fix log for upgrades


## 1.6.9 2023-12-08 <dave at tiredofit dot ca>

   ### Added
      - Add s3ql-upgrade script


## 1.6.8 2023-12-08 <dave at tiredofit dot ca>

   ### Added
      - Add py3-packaging module


## 1.6.7 2023-12-08 <dave at tiredofit dot ca>

   ### Added
      - Change base image to tiredofit/alpine:3.19


## 1.6.6 2023-12-08 <dave at tiredofit dot ca>

   ### Added
      - S3QL 5.1.3


## 1.6.5 2023-09-27 <dave at tiredofit dot ca>

   ### Added
      - S3QL 5.1.2


## 1.6.4 2023-08-06 <dave at tiredofit dot ca>

   ### Added
      - S3QL 5.1.1


## 1.6.3 2023-08-01 <dave at tiredofit dot ca>

   ### Added
      - S3QL 5.1.0


## 1.6.2 2023-07-08 <dave at tiredofit dot ca>

There are breaking changes in the filesystem and your filesystems need to be upgraded to the latest nonreversible version. See https://github.com/s3ql/s3ql/releases/tag/s3ql-5.0.0

   ### Added
      - S3QL 5.0.0


## 1.5.2 2023-07-05 <dave at tiredofit dot ca>

   ### Added
      - S3QL 4.0.1


## 1.6.0 2023-05-17 <dave at tiredofit dot ca>

   ### Added
      - S3QL 5.0.0-prerelease1


## 1.5.1 2023-05-10 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.18 base


## 1.5.0 2023-04-26 <dave at tiredofit dot ca>

   ### Added
      - Add support for _FILE environment variables


## 1.4.1 2023-01-26 <dave at tiredofit dot ca>

   ### Changed
      - Fix for extra arguments not being passed on mount process


## 1.4.0 2023-01-25 <dave at tiredofit dot ca>

   ### Added
      - Add CACHE_SIZE environment variable
      - Make log file names more consistent
      - Create recovery key backup in CONFIG_PATH on filesystem creation
      - Force dismounts on container shutdown

   ### Changed
      - Lots of bug fixes, annoyances, and quirks


## 1.3.0 2023-01-25 <dave at tiredofit dot ca>

   ### Added
      - Add unmount command on container stop to target any `fuse.s3ql` filesystems

   ### Changed
      - Change `S3QL_ARGS` to `MOUNT_ARGS`


## 1.2.0 2023-01-24 <dave at tiredofit dot ca>

   ### Added
      - Pin some python modules to have specific version constraints


## 1.1.0 2023-01-24 <dave at tiredofit dot ca>

   ### Added
      - Add `fsck-now` script for file system checking
      - Add force-dismount script for stuck filesystems that have failed

   ### Changed
      - Properly write to the LOG_PATH


## 1.0.0 2023-01-20 <dave at tiredofit dot ca>

   ### Added
      - Auto create S3QL filesystem if not exist
      - FSCK upon container startup
      - Adjustable compression functionality
      - Adjustable LOG_TYPE
      - Ability to pass extra _ARG values to fsck, mkfs, and mount.s3ql processes
      - Customizable Config Path and Config File Name
      - Ability to switch on or off Cache including Persistent Cache


## 0.0.1 2023-01-20 <dave at tiredofit dot ca>

   ### Added
      - Initial Release
      - S3QL 4.0.0


