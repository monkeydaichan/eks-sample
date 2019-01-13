#!/bin/bash -eu

export ROLE_ARN=$( \
aws cloudformation describe-stacks \
--stack-name ${BASE_STACK_NAME} | \
jq -r '.Stacks[].Outputs[] | select(.OutputKey == "ClusterRoleArn")' | \
jq -r '.OutputValue')

SUBNET_IDS=$(aws cloudformation describe-stacks \
    --stack-name $BASE_STACK_NAME \
    --query 'Stacks[0].Outputs[?OutputKey==`SubnetIds`].[OutputValue][0][0]' \
    | sed -E 's/.(.*)./\1/')

SECURITY_GROUP_IDS=$(aws cloudformation describe-stacks \
    --stack-name $BASE_STACK_NAME \
    --query 'Stacks[0].Outputs[?OutputKey==`SecurityGroups`].[OutputValue][0][0]' \
    | sed -E 's/.(.*)./\1/')

aws eks create-cluster \
    --name $EKS_CLUSTER_NAME \
    --role-arn $ROLE_ARN \
    --resources-vpc-config subnetIds=$SUBNET_IDS,securityGroupIds=$SECURITY_GROUP_IDS