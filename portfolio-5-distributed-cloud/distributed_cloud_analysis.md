# Portfolio 5: Distributed and Cloud Database Exercise

## 1. Introduction

This exercise examines the deployment of PensionPay's NoSQL database using MongoDB Atlas. The objective is to understand how cloud database infrastructure supports data availability, replication, consistency and distributed database operations.

## 2. Cloud Deployment Configuration

PensionPay was deployed using MongoDB Atlas with the following observed configuration:

| Configuration | Value |
|---|---|
| Cluster name | PensionPayCluster |
| Cloud provider | AWS |
| Region | Oregon (us-west-2) |
| Cluster tier | Free |
| MongoDB version | 8.0.37 |
| Observed nodes | 3 |
| Node arrangement | 1 Primary, 2 Secondary |

The database `pensionpay_nosql` and collection `pension_contributions` are hosted within this cloud deployment.

## 3. Database Replication

The observed cluster has one Primary node and two Secondary nodes.

The Primary node receives write operations, while the Secondary nodes maintain replicated copies of the dataset. MongoDB uses the replica set mechanism to maintain data copies across members.

If the Primary becomes unavailable, an eligible Secondary can participate in an election to become the new Primary. This supports database availability and fault tolerance.

## 4. Availability

The three-node arrangement provides redundancy because the database is not dependent on a single node.

If the Primary becomes unavailable, the replica set can elect another eligible member. However, a failover may cause a temporary interruption while the election takes place.

The cloud-hosted deployment also allows the database to be accessed remotely by authorised applications and users.

## 5. Data Consistency

MongoDB routes reads to the Primary by default. This helps applications read from the current primary copy.

Secondary replication is asynchronous, so reading directly from a Secondary may return data that has not yet received the latest update.

For PensionPay, reading contribution and payment status records from the Primary is appropriate where up-to-date transaction information is important. Majority write concern can also be used to require acknowledgement from a majority of voting data-bearing members.

## 6. Sharding and Scalability

Sharding is a MongoDB technique for distributing data across multiple shards to support larger datasets and workloads.

The PensionPay deployment used in this exercise is a replica set arrangement. Sharding was not configured or tested. A sharded deployment could be considered in the future if PensionPay's transaction volume and storage requirements increase.

## 7. Conclusion

The exercise demonstrated the use of MongoDB Atlas as a cloud-hosted database platform for PensionPay. The observed three-node Primary and Secondary arrangement illustrates replication and supports availability through replica set elections.

The deployment also demonstrates how cloud database services can support remote access and future scalability. Sharding remains a possible future enhancement rather than an implemented feature in this exercise.

## 8. References

- MongoDB Documentation: Replication and Replica Set Fundamentals - https://www.mongodb.com/docs/manual/replication/
- MongoDB Documentation: Replica Set Members - https://www.mongodb.com/docs/manual/core/replica-set-members/
- MongoDB Documentation: Read Preference - https://www.mongodb.com/docs/manual/core/read-preference/
- MongoDB Documentation: Write Concern for Replica Sets - https://www.mongodb.com/docs/manual/core/replica-set-write-concern/
