
-- Table: public.client_scoring

-- DROP TABLE IF EXISTS public.client_scoring;

CREATE TABLE IF NOT EXISTS public.client_scoring
(
    id bigint NOT NULL,
    client_id bigint,
    scoring_id bigint,
    CONSTRAINT client_scoring_pkey PRIMARY KEY (id),
    CONSTRAINT fk_scoring_client FOREIGN KEY (client_id)
        REFERENCES public.clients ("Customer_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fk_scoring_score FOREIGN KEY (scoring_id)
        REFERENCES public.credit_scoring (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);



-- Table: public.clients

-- DROP TABLE IF EXISTS public.clients;

CREATE TABLE IF NOT EXISTS public.clients
(
    "Customer_ID" bigint NOT NULL,
    name character varying(256) COLLATE pg_catalog."default",
    sex character(1) COLLATE pg_catalog."default",
    age numeric,
    "Occupation" character varying COLLATE pg_catalog."default",
    "Monthly_Inhand_Salary" double precision,
    "Annual_Income" double precision,
    CONSTRAINT clients_pkey PRIMARY KEY ("Customer_ID")
);


-- Table: public.credit_scoring

-- DROP TABLE IF EXISTS public.credit_scoring;

CREATE TABLE IF NOT EXISTS public.credit_scoring
(
    id bigint NOT NULL,
    description character varying COLLATE pg_catalog."default",
    CONSTRAINT credit_scoring_pkey PRIMARY KEY (id)
);



-- Table: public.loans

-- DROP TABLE IF EXISTS public.loans;

CREATE TABLE IF NOT EXISTS public.loans
(
    id bigint NOT NULL,
    month numeric,
    num_of_loan numeric,
    customer_id bigint,
    type_of_loan character varying COLLATE pg_catalog."default",
    delay_from_due_date numeric,
    num_of_delayed_payment numeric,
    num_credit_inquiries numeric,
    outstanding_debt double precision,
    CONSTRAINT loans_pkey PRIMARY KEY (id),
    CONSTRAINT fk_loan_client FOREIGN KEY (customer_id)
        REFERENCES public.clients ("Customer_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);


-- Insert credit_scoring values
INSERT INTO public.credit_scoring(id, description) VALUES (1, 'Muy Bueno');
INSERT INTO public.credit_scoring(id, description) VALUES (2, 'Bueno');
INSERT INTO public.credit_scoring(id, description) VALUES (3, 'Malo');



-- Import data from .csv files