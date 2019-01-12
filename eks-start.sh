#!/bin/bash -eux

cd `dirname $0`

source env/env.sh

./prepare/create-ssh-key.sh

./prepare/create-base.sh
aws cloudformation wait stack-create-complete \
    --stack-name $BASE_STACK_NAME

./cluster/create-master.sh
while [ `aws eks describe-cluster --name $EKS_CLUSTER_NAME --query cluster.status` = \"CREATING\" ]
do
    echo 'Creating master...'
    sleep 10
done

./cluster/create-worker.sh
aws cloudformation wait stack-create-complete \
    --stack-name $EKS_WORKER_STACK_NAME

./cluster/set-kubectl.sh
./cluster/enable-worker.sh

echo 'START SUCCEEDED!!!'
