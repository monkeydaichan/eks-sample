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
