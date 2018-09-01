#!/usr/bin/env bash
kubectl get pods
kubectl log kafka-deployment-796b4bdbc6-lrlbp
kubectl exec -it kafka-deployment-796b4bdbc6-lrlbp bash
kafka-console-producer.sh --broker-list awslbdnsname:9092 --topic TEST
kafka-console-consumer.sh --bootstrap-server awslbdnsname:9092 --topic TEST -from-beginning



