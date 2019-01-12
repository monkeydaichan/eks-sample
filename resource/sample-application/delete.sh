#!/bin/bash -eu

kubectl delete -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.10.3/examples/guestbook-go/redis-master-controller.json
kubectl delete -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.10.3/examples/guestbook-go/redis-master-service.json
kubectl delete -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.10.3/examples/guestbook-go/redis-slave-controller.json
kubectl delete -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.10.3/examples/guestbook-go/redis-slave-service.json
kubectl delete -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.10.3/examples/guestbook-go/guestbook-controller.json
kubectl delete -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.10.3/examples/guestbook-go/guestbook-service.json
