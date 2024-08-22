# Create environment with Confluent CLI

Create
```
confluent environment create columnar_demo
```
Output
```
+---------------------------+---------------+
| Current                   | false         |
| ID                        | env-2abcde    |
| Name                      | columnar_demo |
| Stream Governance Package |               |
+---------------------------+---------------+
```
```
confluent kafka cluster create columnar_demo_cluster0 --cloud aws --region us-east-1 --type basic --availability single-zone --environment env-2abcde
```
Output
```
+----------------------+---------------------------------------------------------+
| Current              | false                                                   |
| ID                   | lkc-1ab2cd                                              |
| Name                 | columnar_demo_cluster0                                  |
| Type                 | BASIC                                                   |
| Ingress Limit (MB/s) | 250                                                     |
| Egress Limit (MB/s)  | 750                                                     |
| Storage              | 5 TB                                                    |
| Cloud                | aws                                                     |
| Region               | us-east-1                                               |
| Availability         | single-zone                                             |
| Status               | PROVISIONING                                            |
| Endpoint             | SASL_SSL://pkc-p12ab.us-east-1.aws.confluent.cloud:9092 |
| REST Endpoint        | https://pkc-p12ab.us-east-1.aws.confluent.cloud:443     |
+----------------------+---------------------------------------------------------+
```
```
confluent api-key create --environment env-2abcde --resource lkc-1ab2cd
```
Output
```
+------------+------------------------------------------------------------------+
| API Key    | TSEGMKWIATNPQ6UY                                                 |
| API Secret | FFO6pQcXrYIuvYsjKniBsxoOffFfceVM64QsAgfJazu5PvH1dzA3bLQFMUeMt46k |
+------------+------------------------------------------------------------------+
```
```
confluent connect cluster create --environment env-2abcde --cluster lkc-1ab2cd --config-file demo_connector_atlas.json
```
Output
```
+------+--------------------------+
| ID   | lcc-1abcd2               |
| Name | columnar_demo_connector0 |
+------+--------------------------+
```

Remove
```
confluent connect cluster delete --environment env-2abcde --cluster lkc-1ab2cd lcc-1abcd2
```
```
confluent kafka cluster delete --environment env-2abcde lkc-1ab2cd
```
```
confluent environment delete env-2abcde
```
