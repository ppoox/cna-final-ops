#!/bin/bash

# Istio Service Mesh를 내 클러스터에 설치
export ISTIO_VERSION=1.20.4
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=$ISTIO_VERSION TARGET_ARCH=x86_64 sh -

cd istio-$ISTIO_VERSION

# istioctl 클라이언트를 PATH에 잡아준다
export PATH=$PWD/bin:$PATH

# 기본적인 구성인 demo 를 기반으로 설치한다.
istioctl install --set profile=demo --set hub=gcr.io/istio-release

# Istio add-on Dashboard 설치
mv samples/addons/loki.yaml samples/addons/loki.yaml.old
curl -o samples/addons/loki.yaml https://raw.githubusercontent.com/msa-school/Lab-required-Materials/main/Ops/loki.yaml
kubectl apply -f samples/addons

# Monitoring Server - Kiali ServiceType을 ClusterIP에서 LoadBalancer로 변경
kubectl patch svc kiali -n istio-system -p '{"spec": {"type": "LoadBalancer"}}'
kubectl get service -n istio-system

# Tracing Server - Jaeger
kubectl patch svc tracing -n istio-system -p '{"spec": {"type": "LoadBalancer"}}'
kubectl get service -n istio-system

# (1) 직접 전처리
kubectl apply -f <(istioctl kube-inject -f deployment.yaml)


# (2) By installing on the namespace where Istio is enabled
kubectl label namespace tutorial istio-injection=enabled
kubectl apply -f deployment.yaml -n tutorial

# You can enable Istio sidecar injection for a particular pod by adding the label to the pod
sidecar.istio.io/inject=true