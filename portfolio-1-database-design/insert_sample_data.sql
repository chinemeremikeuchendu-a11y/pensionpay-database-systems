
-- 1. Insert employers
INSERT INTO pension.employers
(employer_name, registration_number, email, phone)
VALUES
('Bright Future Technologies', 'EMP-001', 'admin@brightfuture.test', '08030000001'),
('Greenfield Consulting', 'EMP-002', 'admin@greenfield.test', '08030000002');

-- 2. Insert employees
INSERT INTO pension.employees
(employer_id, first_name, last_name, email, employment_date)
VALUES
(1, 'John', 'Adebayo', 'john@brightfuture.test', '2022-01-10'),
(1, 'Mary', 'Okafor', 'mary@brightfuture.test', '2023-03-15'),
(1, 'David', 'Bello', 'david@brightfuture.test', '2021-06-01'),
(2, 'Sarah', 'James', 'sarah@greenfield.test', '2022-08-20'),
(2, 'Michael', 'Adeyemi', 'michael@greenfield.test', '2024-02-01');

-- 3. Insert pension accounts
INSERT INTO pension.pension_accounts
(employee_id, pfa_name, rsa_pin)
VALUES
(1, 'Leadway Pensure', 'RSA-100001'),
(2, 'ARM Pension', 'RSA-100002'),
(3, 'Stanbic IBTC Pension', 'RSA-100003'),
(4, 'NLPC Pension', 'RSA-100004'),
(5, 'Premium Pension', 'RSA-100005');

-- 4. Insert contributions
INSERT INTO pension.contributions
(account_id, contribution_month, employee_amount,
 employer_amount, contribution_status)
VALUES
(1, '2026-10-01', 15000, 22500, 'PAID'),
(2, '2026-10-01', 12000, 18000, 'PAID'),
(3, '2026-10-01', 18000, 27000, 'PENDING'),
(4, '2026-10-01', 10000, 15000, 'PAID'),
(5, '2026-10-01', 14000, 21000, 'PENDING');
