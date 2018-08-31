#!/usr/bin/env bash
cat /var/log/system.log | kafkacat -b 10.10.10.100:9092 -t TEST
kafka-console-producer.sh --broker-list kafka:9092 --topic TEST
kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic TEST