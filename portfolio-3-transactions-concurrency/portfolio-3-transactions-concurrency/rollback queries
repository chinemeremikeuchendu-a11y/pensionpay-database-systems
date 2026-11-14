BEGIN;

INSERT INTO pension.transaction_lab
    (transaction_reference, amount, transaction_status)
VALUES
    ('PEN-TRX-002', 50000.00, 'PENDING');

ROLLBACK;


SELECT *
FROM pension.transaction_lab
WHERE transaction_reference = 'PEN-TRX-002';
