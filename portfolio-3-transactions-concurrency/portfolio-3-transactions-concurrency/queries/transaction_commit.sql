BEGIN;

INSERT INTO pension.transaction_lab
    (transaction_reference, amount, transaction_status)
VALUES
    ('PEN-TRX-001', 37500.00, 'PAID');

COMMIT;


SELECT *
FROM pension.transaction_lab
WHERE transaction_reference = 'PEN-TRX-001';
