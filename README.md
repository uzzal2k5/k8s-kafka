# k8s-kafka
Deploy Kafka cluster by Kubernetes

    kubectl create -f kafka-zookeeper-deploy.yml

DEPLOY AT AWS
    
   
   Change "KAFKA_ADVERTISED_HOST_NAME" value from  "awslbdnsname" with your public DNS (AWS LoadBalancer DNS Name ),
   Keep Service Name for Kafka Service same as "KAFKA_ADVERTISED_HOST_NAME" value
    
    ---
    spec:
          containers:
          ---
          ---
               - name: KAFKA_ADVERTISED_HOST_NAME
                 value: awslbdnsname 
                 
                        # At AWS , Replace This with LoadBalance DNS Name
    
    
    
    ---
    apiVersion: v1
    kind: Service
    metadata:
      name: awslbdnsname
      labels:
        app: kafka


CHANGE EXTERNAL-IP

 You can omit this segment or adjust according to your available public ip or the IP from where you want to access the kafka
   
    externalIPs:
      - 10.32.0.5
TEST KAFKA CLUSTER
    
    kubectl get pods
    kubectl log kafka-deployment-796b4bdbc6-lrlbp
    kubectl exec -it kafka-deployment-796b4bdbc6-lrlbp bash
    kafka-console-producer.sh --broker-list awslbdnsname:9092 --topic TEST
    kafka-console-consumer.sh --bootstrap-server awslbdnsname:9092 --topic TEST -from-beginning
