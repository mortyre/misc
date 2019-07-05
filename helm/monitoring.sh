#!/bin/bash

helm upgrade prometheus-operator --set rbacEnable=true --namespace=monitoring \
    --kube-context prod-eu \
    --set prometheus.prometheusSpec.additionalAlertRelabelConfigs[0].replacement='EU_$1' \
    --set prometheus.prometheusSpec.externalUrl="http://prometheus-eu.prod.whalekit.live:9090/" \
stable/prometheus-operator -f values.yaml

helm upgrade prometheus-operator --set rbacEnable=true --namespace=monitoring \
    --kube-context prod-us \
    --set prometheus.prometheusSpec.additionalAlertRelabelConfigs[0].replacement='US_$1' \
    --set prometheus.prometheusSpec.externalUrl="http://prometheus-us.prod.whalekit.live:9090/" \
stable/prometheus-operator -f values.yaml

sleep 5
curl -X POST http://prometheus-eu.prod.whalekit.live:9090/-/reload
curl -X POST http://prometheus-us.prod.whalekit.live:9090/-/reload
