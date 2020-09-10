#!/usr/bin/env bash
  
# Deploy MySQL instances

for i in {1..6}
do
   echo "Deploying instance to run on port 33${i}0..."
   dbdeployer deploy single 8.0.21 --sandbox-directory=msb${i} --port=33${i}0 --skip-report-host --skip-report-port
done

# Get 3 instances ready to be used in a ReplicaSet

for i in {1..3}
do
   echo "Configuring instance running port 33${i}0 to be ready for ReplicaSet..."
   mysqlsh -- dba configureReplicaSetInstance root:msandbox@localhost:33${i}0 --cluster-admin="myadmin"
done

# Set up Replication

echo "Setting up Replication..."

mysqlsh myadmin@localhost:3310 --sql -e "CREATE USER 'repl'@'%' IDENTIFIED BY 'password'; GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';"

for i in {2..3}
do
    mysqlsh myadmin@localhost:33${i}0 --sql -e "CHANGE MASTER TO MASTER_HOST='localhost', MASTER_PORT=3310, MASTER_USER='repl', MASTER_PASSWORD='password', MASTER_AUTO_POSITION=1, get_master_public_key=1; START SLAVE;"
done

exit 0
