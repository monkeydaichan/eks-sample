#!/bin/bash -eu

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml

kubectl apply -f config/eks-admin-service-account.yaml
kubectl apply -f config/eks-admin-cluster-role-binding.yaml

kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}') | grep ^token

echo 'Access http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/ and login using token.'

kubectl proxy