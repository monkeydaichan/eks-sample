# Automated creation of EKS
Automate the process of [Getting Started with Amazon EKS](https://docs.aws.amazon.com/ja_jp/eks/latest/userguide/getting-started.html)

## Dependency
macOS Mojave
kubectl
AWS CLI

## Usage

### Start EKS

```bash
./eks-start.sh
```

### Deploy Dashboard

```bash
./resource/dashboard/deploy.sh
```

### Deploy sample application

```bash
./resource/sample-application/deploy.sh
```

### Delete sample application

```bash
./resource/sample-application/delete.sh
```

### Add iam user
Only the IAM user who created the EKS cluster can use the kubectl command.  
To use the kubectlk command by another IAM user, you need to update the configmap.  
Change the `<ARN of the IAM user you want to add>` and `<Any name>` of the `prepare/config/configmap.yml` file.

```bash
source env/env.sh

ROLE_ARN=$(aws cloudformation describe-stacks \
    --stack-name $EKS_WORKER_STACK_NAME \
    --query 'Stacks[0].Outputs[0].OutputValue' \
    | sed -E 's/.(.*)./\1/')

cat << EOT > prepare/config/configmap.yml
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: $ROLE_ARN
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
  mapUsers: |
    - userarn: <The ARN of the IAM user you want to add>
      username: <Any name>
      groups:
        - system:masters
```

Deploy `prepare/config/configmap.yml` file.

```bash
kubectl apply -f prepare/config/configmap.yml
```

### Delete EKS

```bash
./all-delete.sh
```

## License
[Apache License 2.0](https://github.com/kubernetes/dashboard/blob/master/LICENSE)

## Authors
- Daichi Yasuda [@monkeydaichan](https://twitter.com/monkeydaichan)

## References
- https://docs.aws.amazon.com/eks/latest/userguide/getting-started.html
