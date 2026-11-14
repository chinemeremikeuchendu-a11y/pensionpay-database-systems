# Portfolio 4: NoSQL and Advanced Data Models

## 1. Introduction

This portfolio demonstrates the implementation of a NoSQL document database for PensionPay, a simulated pension contribution management system. MongoDB Atlas was used to create and manage the database online.

## 2. Database Design

A document-based model was selected. Each pension contribution record is stored as a MongoDB document containing employee details, employer information, contribution amounts, contribution period, and payment status.

The database is named `pensionpay_nosql`, and the collection is `pension_contributions`.

## 3. Implementation

The following activities were completed using MongoDB Atlas:

- Inserted five pension contribution documents.
- Retrieved pending contributions using a status filter.
- Updated David Bello's contribution status from `PENDING` to `PAID`.
- Created and executed an aggregation pipeline to calculate employee counts and total contributions by employer.

The aggregation returned:

| Employer | Employees | Total Contributions |
|---|---:|---:|
| Bright Future Technologies | 3 | 112,500 |
| Greenfield Consulting | 2 | 60,000 |

The total contribution value across the five records was 172,500.

## 4. Suitability of the Document Model

The document model is suitable for PensionPay because related employee, employer, and contribution information can be stored together in a single document. This makes it convenient to retrieve and update contribution records without requiring multiple relational joins.

MongoDB also supports filtering, document updates, and aggregation operations, which are useful for contribution monitoring and employer-level reporting.

## 5. Conclusion

The implementation demonstrated how MongoDB can support PensionPay's contribution management requirements using a flexible document-based data model. MongoDB Atlas provided a cloud-hosted environment for implementing and testing the NoSQL database.
