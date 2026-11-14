# MIT 8103: ADVANCED DATABASE SYSTEMS
## INDIVIDUAL PRACTICAL DATABASE PORTFOLIO

**Academic Session:** 2026/2027  
**Assessment:** First Semester Continuous Assessment  
**Case Study:** PensionPay  
**Database Technologies:** PostgreSQL 18, pgAdmin 4 and MongoDB Atlas  
**GitHub Repository:** https://github.com/chinemeremikeuchendu-a11y/pensionpay-database-systems

---

## 1. Introduction

This practical portfolio documents the design, implementation and evaluation of a database solution for PensionPay, a simulated pension contribution management platform. The project was undertaken to demonstrate the application of advanced database concepts to a business scenario involving employers, employees, pension accounts and contribution records.

The PensionPay system is intended to support the recording and management of pension contributions made by employers and their employees. Its major operations include maintaining employer and employee information, managing pension accounts, recording contribution payments, tracking outstanding contributions and generating reports for monitoring and analysis.

The project was implemented using two database technologies. PostgreSQL 18, managed through pgAdmin 4, was used for relational database design, SQL querying, query optimisation and transaction management. MongoDB Atlas was used to implement the NoSQL component and examine cloud database deployment.

A small synthetic dataset was used throughout the practical exercises. This provided a consistent basis for testing the database operations and comparing the application of relational and document-based data models.

## 2. Portfolio 1: Database Design and Modelling

The first activity focused on designing a relational database structure capable of supporting PensionPay's core operations. PostgreSQL 18 was selected as the relational database management system, and the database was created with the name `pensionpay_db`.

The database was organised around four principal tables:

- **Employers:** Stores information about organisations responsible for making pension contributions.
- **Employees:** Maintains employee information and their relationship with employers.
- **Pension Accounts:** Stores pension account information associated with employees.
- **Contributions:** Records employee and employer contribution amounts, payment periods and contribution status.

The design separates the major entities into related tables rather than keeping all information in a single structure. Primary keys were used to identify records, while foreign keys established relationships between the tables. Appropriate data types and constraints were also applied to support data integrity.

This structure makes it possible to associate each contribution with the relevant employee, employer and pension account. It also provides a foundation for retrieving contribution records and producing reports without unnecessarily duplicating information.

The initial implementation was populated with sample employer, employee, pension account and contribution records. These records were subsequently used in the query processing and transaction exercises.

The design activity provided practical experience in translating business requirements into a relational schema and showed the importance of relationships, keys and constraints in maintaining a structured database.

## 3. Portfolio 2: Query Processing and Optimisation

The second activity examined how SQL queries can be used to retrieve, analyse and present information stored in the PensionPay database. The exercises were performed in pgAdmin 4 against the PostgreSQL database.

Several queries were developed to examine the contribution records from different perspectives. These included database and table verification, monthly contribution analysis, employer contribution summaries and the identification of contributions that were yet to be completed.

The sample dataset contained five employees and five contribution records for October 2026. The analysis produced the following results:

| Contribution Metric | Amount |
|---|---:|
| Total employee contributions | 69,000 |
| Total employer contributions | 103,500 |
| Combined contributions | 172,500 |
| Paid contributions | 92,500 |
| Pending contributions | 80,000 |

The employer-level summary also showed that Bright Future Technologies accounted for three employees and total contributions of 112,500, while Greenfield Consulting accounted for two employees and total contributions of 60,000.

To explore query optimisation, an index named `idx_contributions_status` was created on the `contribution_status` column of the contributions table. The purpose was to examine how indexing could support queries that filter contribution records according to their payment status.

The `EXPLAIN ANALYZE` command was used to inspect query execution plans and observe how PostgreSQL processed the selected queries. Both the execution plans and performance observations were documented as part of the practical evidence.

An important observation from this exercise was that creating an index does not automatically mean PostgreSQL will use it for every query. The query planner considers factors such as table size, estimated cost and the expected number of matching records when selecting an execution plan. This reinforced the importance of examining actual execution plans rather than assuming that an index will always produce a performance improvement.

Overall, this activity provided practical experience in SQL-based reporting, indexing and the examination of database query execution behaviour.

## 4. Portfolio 3: Transactions and Concurrency

The third activity focused on transaction management and the mechanisms used by relational databases to maintain data integrity during operations.

A separate table named `pension.transaction_lab` was created in PostgreSQL to demonstrate transaction behaviour. The table contained a transaction identifier, transaction reference, amount, transaction status and creation timestamp.

Four practical exercises were performed.

**Transaction Commit**

A transaction record with reference `PEN-TRX-001` and an amount of 37,500 was inserted within a transaction block. The `COMMIT` statement was executed to make the change permanent. A subsequent query confirmed that the record existed in the table.

**Transaction Rollback**

A second transaction using reference `PEN-TRX-002` and an amount of 50,000 was initiated. The operation was deliberately rolled back using the `ROLLBACK` statement. A verification query confirmed that the uncommitted record was not retained.

**Transaction Isolation**

The `READ COMMITTED` isolation level was configured and tested within a transaction block. This demonstrated PostgreSQL's transaction isolation configuration and its role in controlling the visibility of committed data during database operations.

**Concurrency Control**

The final exercise demonstrated row-level locking using `SELECT FOR UPDATE`. The record associated with `PEN-TRX-001` was selected for update, its status was changed to `REVERSED`, and the transaction was committed.

This exercise demonstrated how PostgreSQL can lock a selected row while a transaction is working with it, helping to prevent conflicting updates to that record.

The practical activities improved my understanding of transaction boundaries, rollback behaviour, isolation levels and row-level locking. These mechanisms are particularly relevant to systems such as PensionPay, where contribution records and payment statuses must be managed consistently.

## 5. Portfolio 4: NoSQL and Advanced Data Models

The fourth activity introduced a document-oriented approach to managing PensionPay contribution information. MongoDB Atlas was selected for this exercise because it provided an online environment for implementing and testing a NoSQL database without requiring a local MongoDB installation.

A database named `pensionpay_nosql` was created, together with a collection named `pension_contributions`.

Five sample contribution documents were inserted into the collection. Each document contained relevant employee and employer information, a pension account reference, the contribution period, employee and employer contribution amounts, the total contribution and its payment status.

The implementation included four main activities:

1. **Document insertion:** Five pension contribution records were created in the collection using the sample PensionPay dataset.
2. **Document retrieval:** A filter was applied to retrieve contributions with a `PENDING` status. This demonstrated how MongoDB can identify records based on document attributes.
3. **Document update:** The contribution record belonging to David Bello was located and its status was changed from `PENDING` to `PAID`.
4. **Aggregation:** An aggregation pipeline was created to group contribution records by employer, count the employees associated with each employer and calculate the total contribution amount.

The aggregation produced the following results:

| Employer | Employee Count | Total Contributions |
|---|---:|---:|
| Bright Future Technologies | 3 | 112,500 |
| Greenfield Consulting | 2 | 60,000 |
| **Overall Total** | **5** | **172,500** |

The document model was suitable for this exercise because employee, employer and contribution details could be represented together within a single document. This makes the model convenient for retrieving and updating contribution records as a unit.

The exercise also demonstrated that MongoDB supports filtering, document updates and aggregation operations that can be used for reporting and analysis.

Using MongoDB alongside PostgreSQL provided a practical opportunity to understand how relational and document databases can address similar business requirements through different data models.

## 6. Portfolio 5: Distributed and Cloud Database Exercise

The fifth activity examined the deployment of PensionPay's NoSQL database in a cloud-hosted environment using MongoDB Atlas.

The existing MongoDB Atlas deployment, named `PensionPayCluster`, was inspected to understand its configuration and distributed database arrangement. The observed configuration was as follows:

| Configuration | Observed Details |
|---|---|
| Cluster name | PensionPayCluster |
| Cloud provider | AWS |
| Deployment region | Oregon (us-west-2) |
| Cluster tier | Free |
| MongoDB version | 8.0.37 |
| Observed topology | Three nodes |
| Node arrangement | One Primary and two Secondary |

The cluster overview provided practical evidence of a three-node replica set arrangement.

**Replication:** In this configuration, the Primary node handles write operations, while Secondary nodes maintain replicated copies of the data. MongoDB replica sets use this arrangement to provide redundant copies of the database. The replica set can elect an eligible Secondary as the new Primary if the existing Primary becomes unavailable.

**Availability:** Having multiple replica set members reduces dependence on a single database node. If the Primary becomes unavailable, an election can allow an eligible Secondary to take over. This supports availability, although a temporary interruption may occur during the election process.

**Consistency:** MongoDB's read and write settings influence how clients interact with replicated data. Reads directed to the Primary provide access to the current primary copy, while reads from Secondary members may return data that has not yet received the latest replicated update. For a pension contribution platform, this distinction is important when retrieving payment statuses and other transaction-related information.

**Scalability and Sharding:** Sharding was examined as a database scaling concept. It allows data to be distributed across multiple shards to support larger datasets and workloads. However, sharding was not configured or implemented in this exercise. The observed PensionPay deployment was a replica set arrangement.

This activity provided practical exposure to cloud database deployment and an opportunity to examine how replication, availability and consistency relate to a database application.

## 7. Technical Reflection and Lessons Learned

Working through the five portfolio activities helped strengthen my practical understanding of database design, implementation and management. The exercises also provided an opportunity to connect database concepts with operations that would be relevant to a system handling financial records.

One of the important lessons from the relational design exercise was the need to establish clear relationships between database entities. Separating employers, employees, pension accounts and contributions made the data easier to organise and retrieve.

The query optimisation exercise improved my understanding of how SQL queries are processed by the database engine. In particular, examining execution plans showed that database performance decisions should be based on actual query behaviour rather than assumptions about indexing.

The transaction exercises were also useful because they demonstrated the consequences of committing and rolling back database changes. The row-level locking exercise further highlighted the importance of controlling access to records when updates are being performed.

A practical challenge encountered during the NoSQL exercise was setting up the MongoDB environment. Since a local MongoDB installation was not available, MongoDB Atlas was used to complete the implementation online. This provided an opportunity to work with a cloud-hosted database and become familiar with its management interface.

Another useful learning experience was working with MongoDB aggregation pipelines. Grouping contribution records by employer provided a practical demonstration of how document databases can perform data analysis without relying on the same query structure used in relational databases.

Throughout the project, I relied on my existing technical background and understanding of IT systems to approach the implementation activities. Where I encountered unfamiliar errors, technical roadblocks or concepts that required further clarification, I consulted documentation and used AI assistance as a supplementary troubleshooting and learning resource. This helped me understand the issues encountered and determine appropriate ways to proceed.

The overall exercise reinforced the importance of selecting database technologies based on application requirements, maintaining data integrity and understanding the operational characteristics of different database architectures.

## 8. Conclusion

The PensionPay database portfolio brought together five areas of advanced database systems through practical implementation. PostgreSQL was used to develop the relational database, analyse contribution records, inspect query execution plans and demonstrate transaction management. MongoDB Atlas was used to implement the document-based model and examine cloud database deployment.

The activities demonstrated how relational and NoSQL technologies can support different aspects of the same application. They also provided practical insight into transaction integrity, query execution, indexing, document aggregation, replication and database availability.

The completed work is organised in the accompanying GitHub repository, which contains the implementation evidence, screenshots, scripts and supporting technical documentation.

## 9. AI Use Declaration

ChatGPT was used as a supplementary learning and troubleshooting resource during this assessment. I approached the practical activities using my existing technical background and prior knowledge of IT systems and database-related concepts.

AI assistance was sought when I encountered technical roadblocks, unfamiliar errors or concepts that required further clarification. It was used to help explain issues, explore possible solutions and support the resolution of implementation challenges.

The guidance obtained was reviewed and applied during the practical exercises using PostgreSQL, pgAdmin 4 and MongoDB Atlas. The implementation activities, outputs and supporting evidence were examined as part of the process.

AI was therefore used to supplement my existing knowledge and assist with problem-solving, rather than as a replacement for my own practical work and understanding. Responsibility for the accuracy and explanation of the submitted work remains mine.

## 10. References

1. PostgreSQL Global Development Group. *PostgreSQL Documentation*. https://www.postgresql.org/docs/
2. MongoDB, Inc. *MongoDB Manual*. https://www.mongodb.com/docs/manual/
3. MongoDB, Inc. *MongoDB Atlas Documentation*. https://www.mongodb.com/docs/atlas/
4. MIT 8103 Advanced Database Systems. *First Semester Continuous Assessment, 2026/2027 Academic Session*.
