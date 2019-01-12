#/bin/sh

aws cloudformation create-stack \
--stack-name ${BASE_STACK_NAME} \
--template-body=file://prepare/config/eks-base.yml \
--capabilities CAPABILITY_NAMED_IAM