#!/bin/bash

for i in `kubectl get deploy -n $1 | cut -d ' ' -f1 | grep -v NAME`
do
        echo injecting sidecar into $i
        kubectl get deployment $i -n $1 -o yaml | ~/istio-1.2.0/bin/istioctl kube-inject -f - | kubectl apply -f -
done

