# DB AMA: MySQL InnoDB Cluster & ReplicaSet

This repository includes the guidelines and tools written to run the demos
presented during DB AMA's session about MySQL InnoDB Cluster & ReplicaSet.

[DB AMA](https://dbama.now.sh/)

## Pre-requisites

The following must be installed and ready to be used:

[MySQL-Shell](https://dev.mysql.com/downloads/shell/)

[MySQL-Router](https://dev.mysql.com/downloads/router/)

[DBDeployer](https://github.com/datacharmer/dbdeployer)

### Install MySQL-Server using DBDeployer

Get the latest MySQL Server 8.0 version using:

`dbdeployer downloads get-by-version 8.0 --newest --OS=linux --minimal`

Or alternatively, specify the download. For example:

`dbdeployer downloads get-unpack mysql-8.0.21-linux-glibc2.17-x86_64-minimal.tar.xz`

[More info](https://www.dbdeployer.com/#getting-remote-tarballs)

## Usage

### Init environment

1. Run the init script:

`./init.sh`

*NOTE: Set the same password for the myadmin account*

2. Follow the steps as in the session :)

[Recorded Session](https://youtu.be/AsfFY555LCc)

### Destroy enviroment

`dbdeployer delete msb1 && dbdeployer delete msb2 && dbdeployer delete msb3 && dbdeployer delete msb4 && dbdeployer delete msb5 && dbdeployer delete msb6`

## MySQL AdminAPI documentation/userguide

Please take a look at the [AdminAPI userguide](https://dev.mysql.com/doc/refman/8.0/en/admin-api-userguide.html) to clarify any doubts or to get more information about it.

## Contributing
Pull requests are **very** welcome.

If you find any problem, please open an issue.

## License
[MIT](https://choosealicense.com/licenses/mit/)
