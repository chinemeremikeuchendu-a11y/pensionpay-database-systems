# MIT 8103: ADVANCED DATABASE SYSTEMS
## INDIVIDUAL PRACTICAL DATABASE PORTFOLIO

**Academic Session:** 2026/2027  
**Assessment:** First Semester Continuous Assessment  
**Case Study:** PensionPay  
**Technologies:** PostgreSQL 18, pgAdmin 4 and MongoDB Atlas

### 1. Introduction

This portfolio presents the design and implementation of PensionPay, a simulated pension contribution management system. The system was developed as a practical case study for applying advanced database concepts to the management of employers, employees, pension accounts and contribution records.

The implementation involved two database technologies. PostgreSQL 18, managed through pgAdmin 4, was used for relational database design, query processing, optimisation and transaction management. MongoDB Atlas was used to implement a document-based database and examine cloud database deployment.

A consistent set of synthetic records was used throughout the exercises to demonstrate the different database operations.

### 2. Portfolio Activities and Implementation

**Portfolio 1: Database Design and Modelling**

A relational database named `pensionpay_db` was created in PostgreSQL. Its structure consists of four main tables: `employers`, `employees`, `pension_accounts` and `contributions`.

The tables were connected using primary and foreign keys to establish relationships and maintain referential integrity. The design separated the major business entities to reduce unnecessary data duplication and support structured data retrieval. Sample records were inserted to validate the database structure and relationships.

**Portfolio 2: Query Processing and Optimisation**

SQL queries were developed to retrieve and analyse contribution records. The practical exercises included monthly contribution analysis, employer contribution summaries, database verification and identification of pending contributions.

The five sample contribution records produced a combined contribution value of **172,500**, comprising 69,000 in employee contributions and 103,500 in employer contributions.

An index, `idx_contributions_status`, was created on the `contribution_status` column. The `EXPLAIN ANALYZE` command was used to inspect query execution plans and examine how PostgreSQL processed selected queries. This exercise demonstrated that indexing must be evaluated against actual query execution behaviour rather than assumed to improve every query.

**Portfolio 3: Transactions and Concurrency**

A separate table, `pension.transaction_lab`, was created to demonstrate transaction management.

Four operations were performed: a transaction was committed using `COMMIT`, an uncommitted transaction was reversed using `ROLLBACK`, the `READ COMMITTED` isolation level was configured and tested, and row-level locking was demonstrated using `SELECT FOR UPDATE`.

The concurrency exercise involved locking the record `PEN-TRX-001`, changing its status to `REVERSED` and committing the update. These activities demonstrated how transaction controls help preserve data integrity and manage changes to financial records.

**Portfolio 4: NoSQL and Advanced Data Models**

MongoDB Atlas was used to create a database named `pensionpay_nosql` and a collection named `pension_contributions`.

Five contribution documents were inserted using the PensionPay sample dataset. The implementation included retrieving pending contributions, updating David Bello's contribution status from `PENDING` to `PAID`, and executing an aggregation pipeline to summarise contributions by employer.

The aggregation returned 112,500 for Bright Future Technologies, representing three employees, and 60,000 for Greenfield Consulting, representing two employees. The results demonstrated how MongoDB document queries and aggregation operations can support contribution monitoring and reporting.

**Portfolio 5: Distributed and Cloud Database Exercise**

The MongoDB Atlas deployment was examined to understand cloud hosting and distributed database concepts. The observed configuration of `PensionPayCluster` was AWS, Oregon (`us-west-2`), Free tier, MongoDB 8.0.37, with three nodes comprising one Primary and two Secondary members.

This arrangement demonstrated the use of replica sets for maintaining replicated data. The exercise examined how Secondary members maintain copies of data and how an eligible Secondary can participate in an election if the Primary becomes unavailable.

The activity also considered consistency, particularly the difference between reading from a Primary and reading from a Secondary that may not yet have received the latest update. Sharding was discussed as a possible future scalability approach but was not implemented.

### 3. Technical Reflection

The practical exercises strengthened my understanding of how database design decisions affect data organisation, retrieval and integrity. Working with PostgreSQL provided useful experience in relational modelling, SQL querying, execution plans and transaction management.

One important observation from the optimisation exercise was that the presence of an index does not guarantee that the database engine will use it. Reviewing execution plans provided a better understanding of how PostgreSQL evaluates query execution strategies.

The transaction exercises also highlighted the importance of controlling database changes, particularly in systems where financial records must remain consistent.

A challenge encountered during the NoSQL exercise was the absence of a local MongoDB installation. This was addressed by using MongoDB Atlas, which provided an online environment for creating the database, inserting documents, running queries and inspecting the cluster configuration.

My existing technical background helped me approach the practical activities and understand the underlying concepts. Where I encountered technical roadblocks or unfamiliar issues, I consulted relevant documentation and used AI assistance to clarify concepts, troubleshoot errors and identify possible solutions.

Overall, the project improved my practical understanding of relational and document databases and how concepts such as transaction integrity, indexing, aggregation, replication and availability apply to a business database system.

### 4. Conclusion

The PensionPay portfolio demonstrated the practical application of five advanced database areas: relational design, query optimisation, transaction management, NoSQL implementation and cloud database deployment.

Using PostgreSQL and MongoDB Atlas provided an opportunity to work with different database architectures while maintaining a consistent business case study. The completed implementation and supporting evidence are organised in the GitHub repository.

### 5. GitHub Repository

**Project Repository:**  
https://github.com/chinemeremikeuchendu-a11y/pensionpay-database-systems

The repository contains the five portfolio activities, implementation scripts, screenshots and supporting technical documentation.

### 6. AI Use Declaration

ChatGPT was used as a supplementary learning and troubleshooting resource during this assessment. I approached the practical exercises using my existing technical background and prior knowledge of IT systems and database concepts.

AI assistance was sought when I encountered technical roadblocks, unfamiliar errors or concepts requiring further clarification. It helped me understand issues, explore possible solutions and resolve implementation challenges.

The guidance received was reviewed and applied during the practical exercises using PostgreSQL, pgAdmin 4 and MongoDB Atlas. AI was used to supplement my existing knowledge and support problem-solving, rather than replace my practical work or understanding. Responsibility for the submitted work and its accuracy remains mine.

### 7. References

1. PostgreSQL Global Development Group. *PostgreSQL Documentation*. https://www.postgresql.org/docs/
2. MongoDB, Inc. *MongoDB Manual*. https://www.mongodb.com/docs/manual/
3. MongoDB, Inc. *MongoDB Atlas Documentation*. https://www.mongodb.com/docs/atlas/
4. MIT 8103 Advanced Database Systems. *First Semester Continuous Assessment, 2026/2027 Academic Session*.
