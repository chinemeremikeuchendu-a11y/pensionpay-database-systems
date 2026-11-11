-- Table: pension.employees

-- DROP TABLE IF EXISTS pension.employees;

CREATE TABLE IF NOT EXISTS pension.employees
(
    employee_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    employer_id bigint NOT NULL,
    first_name character varying(80) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(80) COLLATE pg_catalog."default" NOT NULL,
    email character varying(150) COLLATE pg_catalog."default",
    employment_date date,
    status character varying(20) COLLATE pg_catalog."default" DEFAULT 'ACTIVE'::character varying,
    CONSTRAINT employees_pkey PRIMARY KEY (employee_id),
    CONSTRAINT fk_employee_employer FOREIGN KEY (employer_id)
        REFERENCES pension.employers (employer_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT chk_employee_status CHECK (status::text = ANY (ARRAY['ACTIVE'::character varying, 'INACTIVE'::character varying]::text[]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS pension.employees
    OWNER to postgres;

-- Table: pension.employers

-- DROP TABLE IF EXISTS pension.employers;

CREATE TABLE IF NOT EXISTS pension.employers
(
    employer_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    employer_name character varying(150) COLLATE pg_catalog."default" NOT NULL,
    registration_number character varying(50) COLLATE pg_catalog."default" NOT NULL,
    email character varying(150) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(20) COLLATE pg_catalog."default",
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT employers_pkey PRIMARY KEY (employer_id),
    CONSTRAINT employers_email_key UNIQUE (email),
    CONSTRAINT employers_registration_number_key UNIQUE (registration_number)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS pension.employers
    OWNER to postgres;


-- Table: pension.employers

-- DROP TABLE IF EXISTS pension.employers;

CREATE TABLE IF NOT EXISTS pension.employers
(
    employer_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    employer_name character varying(150) COLLATE pg_catalog."default" NOT NULL,
    registration_number character varying(50) COLLATE pg_catalog."default" NOT NULL,
    email character varying(150) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(20) COLLATE pg_catalog."default",
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT employers_pkey PRIMARY KEY (employer_id),
    CONSTRAINT employers_email_key UNIQUE (email),
    CONSTRAINT employers_registration_number_key UNIQUE (registration_number)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS pension.employers
    OWNER to postgres;

-- Table: pension.pension_accounts

-- DROP TABLE IF EXISTS pension.pension_accounts;

CREATE TABLE IF NOT EXISTS pension.pension_accounts
(
    account_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    employee_id bigint NOT NULL,
    pfa_name character varying(150) COLLATE pg_catalog."default" NOT NULL,
    rsa_pin character varying(30) COLLATE pg_catalog."default" NOT NULL,
    account_status character varying(20) COLLATE pg_catalog."default" DEFAULT 'ACTIVE'::character varying,
    CONSTRAINT pension_accounts_pkey PRIMARY KEY (account_id),
    CONSTRAINT pension_accounts_employee_id_key UNIQUE (employee_id),
    CONSTRAINT pension_accounts_rsa_pin_key UNIQUE (rsa_pin),
    CONSTRAINT fk_account_employee FOREIGN KEY (employee_id)
        REFERENCES pension.employees (employee_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT chk_account_status CHECK (account_status::text = ANY (ARRAY['ACTIVE'::character varying, 'INACTIVE'::character varying]::text[]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS pension.pension_accounts
    OWNER to postgres;

-- Table: pension.contributions

-- DROP TABLE IF EXISTS pension.contributions;

CREATE TABLE IF NOT EXISTS pension.contributions
(
    contribution_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    account_id bigint NOT NULL,
    contribution_month date NOT NULL,
    employee_amount numeric(14,2) NOT NULL,
    employer_amount numeric(14,2) NOT NULL,
    total_amount numeric(14,2) GENERATED ALWAYS AS ((employee_amount + employer_amount)) STORED,
    contribution_status character varying(20) COLLATE pg_catalog."default" DEFAULT 'PENDING'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT contributions_pkey PRIMARY KEY (contribution_id),
    CONSTRAINT uq_account_contribution_month UNIQUE (account_id, contribution_month),
    CONSTRAINT fk_contribution_account FOREIGN KEY (account_id)
        REFERENCES pension.pension_accounts (account_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT chk_contribution_status CHECK (contribution_status::text = ANY (ARRAY['PENDING'::character varying, 'PAID'::character varying, 'FAILED'::character varying, 'REVERSED'::character varying]::text[])),
    CONSTRAINT chk_employee_amount CHECK (employee_amount >= 0::numeric),
    CONSTRAINT chk_employer_amount CHECK (employer_amount >= 0::numeric)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS pension.contributions
    OWNER to postgres;